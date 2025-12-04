// Import necessary packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Expense model
class Expense {
  final String title;
  final double amount;
  final DateTime date;
  final String category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });
}

// Fake data
final List<Expense> _registeredExpenses = [
  Expense(
    title: 'Flutter Course',
    amount: 19.99,
    date: DateTime(2024, 11, 24),
    category: 'work',
  ),
  Expense(
    title: 'Cinema',
    amount: 15.69,
    date: DateTime(2024, 11, 24),
    category: 'leisure',
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Expense Tracker',
       theme: ThemeData(
         primarySwatch: Colors.blue,
         useMaterial3: true,
       ),
       home: Builder(
         builder: (context) => Scaffold(
           appBar: AppBar(
             title: const Text('Ronan-The-Best Expenses App'),
             actions: [
               IconButton(
                 icon: const Icon(Icons.add),
                 color: Colors.blue,
                 onPressed: () {
                   showModalBottomSheet(
                     context: context,
                     shape: const RoundedRectangleBorder(
                       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                     ),
                     builder: (ctx) {
                       return Container(
                         padding: const EdgeInsets.all(32),
                         child: Center(
                           child: ElevatedButton(
                             onPressed: () => Navigator.of(ctx).pop(),
                             child: const Text('Close modal'),
                           ),
                         ),
                       );
                     },
                   );
                 },
               ),
             ],
           ),
           body: Expenses(),
         ),
       ),
     );
   }
}

// ExpenseItem widget
class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem(this.expense, {super.key});

  IconData getCategoryIcon(String category) {
    switch (category) {
      case 'work':
        return Icons.work;
      case 'leisure':
        return Icons.movie;
      default:
        return Icons.money;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expense.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${expense.amount.toStringAsFixed(2)}'),
              ],
            ),
            const Spacer(),
            Icon(getCategoryIcon(expense.category)),
            const SizedBox(width: 8),
            Text(DateFormat.yMd().format(expense.date)),
          ],
        ),
      ),
    );
  }
}

// Expenses widget
class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _registeredExpenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(_registeredExpenses[index]),
    );
  }
}