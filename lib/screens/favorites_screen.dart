import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty)
      return Center(
        child: Text('You have no favorites - start adding some!'),
      );
    else
      return ListView.builder(
        itemBuilder: (context, index) {
          final currentMeal = favoriteMeals[index];

          return MealItem(
              id: currentMeal.id,
              title: currentMeal.title,
              imageUrl: currentMeal.imageUrl,
              duration: currentMeal.duration,
              complexity: currentMeal.complexity,
              affordability: currentMeal.affordability);
        },
        itemCount: favoriteMeals.length,
      );
  }
}
