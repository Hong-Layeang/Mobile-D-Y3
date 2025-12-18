import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
 
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leisure;
  DateTime? _selectedDate;

  @override
  void dispose(){
    super.dispose();

    _titleController.dispose();
    _amountController.dispose();
  }

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void onCreate() {
    //  1 Build an expense
    String  title = _titleController.text;
    double amount = double.tryParse(_amountController.text) ?? 0;
    Category category = _selectedCategory;
    DateTime date = _selectedDate ?? DateTime.now();

    Expense newExpense = Expense(title: title, amount: amount, date: date, category: category);

    // Pass the expense back to parent
    widget.onCreated(newExpense);
    
    // Close the modal
    Navigator.pop(context);
  }
  
  void onCancel() {
   
    // Close the modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(label: Text("Amount")),
            keyboardType: TextInputType.number,
            maxLength: 50,
          ),
          DropdownButton<Category>(
            value: _selectedCategory,
            items: Category.values.map((category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.name.toUpperCase()),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedCategory = value;
                });
              }
            },
          ),
          Row(
            children: [
              Text(
                _selectedDate == null
                    ? 'No date selected'
                    : DateFormat.yMd().format(_selectedDate!),
              ),
              const Spacer(),
              IconButton(
                onPressed: presentDatePicker,
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text("Cancel")),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: onCreate, child: const Text("Create")),
            ],
          ),
        ],
      ),
    );
  }
}
