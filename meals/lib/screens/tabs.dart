import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/mian_drawar.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

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

  void _setScreen(String identifier) async {
    // future
    Navigator.pop(context); //closing side bar

    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        // result
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });

      // print(result);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        // _selectedFilters[Filter.glutenFree]! never be null
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
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
        availableMeals: availableMeals,
        onToggleFavorite: _toggleMealFavorites,
      );
      activePageTitle = 'Categories';
    }
    return Scaffold(
      drawer: MianDrawar(
        onSelectedScreen: _setScreen,
      ),
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
