import 'package:flutter/material.dart';

import '../../models/grocery.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {

  // Default settings
  static const defaultName = "New grocery";
  static const defaultQuantity = 1;
  static const defaultCategory = GroceryCategory.fruit;

  // Inputs
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  GroceryCategory _selectedCategory = defaultCategory;

  @override
  void initState() {
    super.initState();

    // Initialize intputs with default settings
    _nameController.text = defaultName;
    _quantityController.text = defaultQuantity.toString();
  }

  @override
  void dispose() {
    // Dispose the controlers
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void onReset() {
    setState(() {
      _nameController.text = defaultName;
      _quantityController.text = defaultQuantity.toString();
      _selectedCategory = defaultCategory;
    });
  }

  void onAdd() {
    final enteredName = _nameController.text.trim();
    final enteredQuantity = int.tryParse(_quantityController.text);

    final isInvalidQuantity = enteredQuantity == null || enteredQuantity < 1;
    final isInvalidName = enteredName.isEmpty;

    if (isInvalidName || isInvalidQuantity) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please provide a valid name and a quantity of 1 or more.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final newGrocery = Grocery(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: enteredName,
      quantity: enteredQuantity,
      category: _selectedCategory,
    );

    Navigator.of(context).pop(newGrocery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Name')),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    decoration: const InputDecoration(label: Text('Quantity')),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<GroceryCategory>(
                    value: _selectedCategory,
                    items: GroceryCategory.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  color: category.color,
                                ),
                                const SizedBox(width: 8),
                                Text(category.label.toLowerCase()),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    selectedItemBuilder: (context) => GroceryCategory.values
                        .map(
                          (category) => Row(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: category.color,
                              ),
                              const SizedBox(width: 8),
                              Text(category.label.toLowerCase()),
                            ],
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: onReset, child: const Text('Reset')),
                ElevatedButton(
                  onPressed: onAdd,
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
