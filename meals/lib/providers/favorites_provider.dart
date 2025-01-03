import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //type of data
  FavoriteMealsNotifier()
      : super([]); // super pass initial data (any shape) [] empty list

  //methods to edit data (as tabs.dart)
  //Never edit the value with StateModifier, instead re-assign

  //on this case can't edit, therefore .add .remove not allowed
  bool toggleMealsFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      //
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal]; // add meal if not favorite
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
