import 'package:flutter/material.dart';
import 'package:flutter_complete_guide_7_meals_app/models/meal.dart';
import 'package:flutter_complete_guide_7_meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late Map<String, String> args;
  late String title;
  late String categoryId;
  late List<Meal> meals;

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    title = args['title']!;
    categoryId = args['id']!;
    meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      meals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            affordability: currentMeal.affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
