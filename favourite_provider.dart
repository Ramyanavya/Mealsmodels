import 'package:flutter/material.dart';

import '../models/meals_models.dart';


class FavoriteProvider with ChangeNotifier {
  final List<String> _favoriteMealIds = [];
  List<Meal> _allMeals = []; // Store all meals in a private variable

  List<String> get favoriteMealIds => _favoriteMealIds;

  // Setter to initialize or update all meals from an external source
  set allMeals(List<Meal> meals) {
    _allMeals = meals;
    notifyListeners();
  }

  bool isFavorite(String mealId) {
    return _favoriteMealIds.contains(mealId);
  }

  void toggleFavorite(String mealId) {
    if (_favoriteMealIds.contains(mealId)) {
      _favoriteMealIds.remove(mealId);
    } else {
      _favoriteMealIds.add(mealId);
    }
    notifyListeners();
  }

  List<Meal> get favoriteMeals {
    // Use _allMeals to get the list of favorite meals
    return _allMeals
        .where((meal) => _favoriteMealIds.contains(meal.id))
        .toList();
  }
}