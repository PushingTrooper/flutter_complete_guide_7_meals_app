import 'package:flutter/material.dart';
import 'package:flutter_complete_guide_7_meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories-meals';

  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final title = args['title']!;
    final categoryId = args['id']!;
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final currentMeal = meals[index];

          return MealItem(
              id: currentMeal.id,
              title: currentMeal.title,
              imageUrl: currentMeal.imageUrl,
              duration: currentMeal.duration,
              complexity: currentMeal.complexity,
              affordability: currentMeal.affordability);
        },
        itemCount: meals.length,
      ),
    );
  }
}
