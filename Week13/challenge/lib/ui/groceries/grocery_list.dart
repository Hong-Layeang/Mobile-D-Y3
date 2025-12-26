import 'package:flutter/material.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';
import 'grocery_form.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  String searchText = '';

  void onCreate() async {
    // Navigate to the form screen using the Navigator push
    Grocery? newGrocery = await Navigator.push<Grocery>(
      context,
      MaterialPageRoute(builder: (context) => const GroceryForm()),
    );
    if (newGrocery != null) {
      setState(() {
        dummyGroceryItems.add(newGrocery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
        ),
        body: TabBarView(
          children: [
            _buildAllGroceries(),
            _buildSearchGroceries(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).bottomAppBarTheme.color ??
              Theme.of(context).colorScheme.surface,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            tabs: const [
              Tab(
                icon: Icon(Icons.local_grocery_store),
                text: 'Groceries',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _buildAllGroceries() {
    if (dummyGroceryItems.isEmpty) {
      return const Center(child: Text('No items added yet'));
    }

    return ListView.builder(
      itemCount: dummyGroceryItems.length,
      itemBuilder: (context, index) =>
        GroceryTile(grocery: dummyGroceryItems[index]),
    );
  }

  Widget _buildSearchGroceries() {
    final filteredItems = dummyGroceryItems
        .where((item) =>
            item.name.toLowerCase().startsWith(searchText.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Search grocery',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) =>
                GroceryTile(grocery: filteredItems[index]),
          ),
        ),
      ],
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(width: 15, height: 15, color: grocery.category.color),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}
