import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/main.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: 'some',
          meals: [],
          categoryColor: Colors.amber,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your category'),
      ),
      body: GridView(
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
                    _selectCategory(context);
                  })
          ]),
    );
  }
}
