import 'package:flutter/material.dart';
import 'package:flutter_complete_guide_7_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static final routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('You filters'),),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters!'),
      ),
    );
  }
}
