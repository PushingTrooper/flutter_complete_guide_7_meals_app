import 'package:flutter/material.dart';
import 'package:flutter_complete_guide_7_meals_app/category_item.dart';
import 'package:flutter_complete_guide_7_meals_app/dummy_data.dart';

import './models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((e) => CategoryItem(e.id, e.title, e.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          )),
    );
  }
}
