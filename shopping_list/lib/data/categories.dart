import 'package:flutter/material.dart';
import 'package:shopping_list/model/category.dart';
import 'package:shopping_list/model/categories.dart';

const categories = {
  Categories.vegetables: GroceryCategory(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: GroceryCategory(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: GroceryCategory(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: GroceryCategory(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: GroceryCategory(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: GroceryCategory(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: GroceryCategory(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: GroceryCategory(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: GroceryCategory(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: GroceryCategory(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};
