import 'package:favorite_places/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []); // initial

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state]; // update state (list)
  }
}

final UserPlacesProvider = StateNotifierProvider(
  (ref) => UserPlacesNotifier(),
);
