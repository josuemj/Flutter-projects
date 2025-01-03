import 'package:flutter/material.dart';

import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/mian_drawar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    // future
    Navigator.pop(context); //closing side bar

    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        // result
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );

      // print(result);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);

      activePage = MealsScreen(
        meals: favoriteMeals,
        categoryColor: Colors.green,
      );
      activePageTitle = 'Your favorites';
    } else {
      activePage = CategoriesScreen(
        availableMeals: availableMeals,
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
