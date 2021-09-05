import 'package:flutter/material.dart';
import 'package:flutter_complete_guide_7_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> _filters;

  const FiltersScreen(this._filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget._filters['gluten']!;
    _vegetarian = widget._filters['vegetarian']!;
    _vegan = widget._filters['vegan']!;
    _lactoseFree = widget._filters['lactose']!;

    super.initState();
  }

  Widget _buildSwitchListTitle(String title, String desription, bool value,
      Function(bool)? updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(desription),
        value: value,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You filters'),
        actions: [
          IconButton(
              onPressed: () {
                widget.saveFilters({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                });
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTitle(
                  'Gluten Free', 'Only include gluten-free meals.', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTitle(
                  'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTitle(
                  'Vegan', 'Only include Vegan meals.', _vegan, (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              _buildSwitchListTitle('Lactose Free',
                  'Only include lactose-free meals.', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
