import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavorites(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no lonfer favorite');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('Marked as favorite ');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavorites,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        onToggleFavorite: _toggleMealFavorites,
        meals: _favoriteMeals,
        categoryColor: Colors.green,
      );
      activePageTitle = 'Your favorites';
    } else {
      activePage = CategoriesScreen(
        onToggleFavorite: _toggleMealFavorites,
      );
      activePageTitle = 'Categories';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage, //dynamic based on
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex, //highlight the icon on bar
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorires',
          ),
        ],
      ),
    );
  }
}
