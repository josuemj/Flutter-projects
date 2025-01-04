import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // Multiple animations -> Ticker not single
  late AnimationController _animationController; // will have a value (late)

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0, // default
      upperBound: 1, //default
    );

    //play/start animation
    // _animationController.stop(); // stop animation (sample)
    _animationController.forward(); //
  }

  @override
  void dispose() {
    //clean up work
    _animationController
        .dispose(); //make sure that animation is removed from devise memory
    super.dispose();
  }

  void _selectCategory(
    BuildContext context,
    Category category,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: widget.availableMeals
              .where((meal) => meal.categories.contains(category.id))
              .toList(),
          categoryColor: category.color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.bounceInOut,
              ),
            ),
            child: child),
        child: GridView(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2, // aspect ratio
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            //availableCategories.map((item) => Cate...);
            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    _selectCategory(context, category);
                  })
          ],
        ));
  }
}
