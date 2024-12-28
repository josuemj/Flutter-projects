import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/meal.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    super.key,
    required this.meal,
    required this.categoryColor,
  });

  final Meal meal;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                categoryColor.withValues(alpha: 0.9),
                Colors.amberAccent
              ],
            ),
          ),
          child: Text(meal.title)),
    );
  }
}
