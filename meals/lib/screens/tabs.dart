import 'package:flutter/material.dart';
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

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget activePage = const CategoriesScreen();

  @override
  Widget build(BuildContext context) {
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = const MealsScreen(
        meals: [],
        categoryColor: Colors.green,
      );
      activePageTitle = 'Your favorites';
    } else {
      activePage = const CategoriesScreen();
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
