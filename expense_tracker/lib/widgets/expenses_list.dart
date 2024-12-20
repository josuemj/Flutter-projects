import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expensesList,
  });

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ExpensesItem(
        expense: expensesList[index],
      ),
      itemCount: expensesList.length,
    );
  }
}
