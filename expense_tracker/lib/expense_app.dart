import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() {
    return _ExpenseAppState();
  }
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<Expense> expenses = [
    Expense(
      title: "Campero",
      amount: 23.0,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Fluttter course",
      amount: 12.99,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  _openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Tracker",
        ),
        backgroundColor: Colors.amberAccent,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesList(
              expensesList: expenses,
            ),
          ),
        ],
      ),
    );
  }
}
