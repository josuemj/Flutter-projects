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
    showModalBottomSheet(
        isScrollControlled: true, // modal takes all space available
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final exspenseIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // cleans all snackbars or content
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Expense deleted'),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              expenses.insert(exspenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text('No expenses, start adding some'));

    if (expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expensesList: expenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Tracker",
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
