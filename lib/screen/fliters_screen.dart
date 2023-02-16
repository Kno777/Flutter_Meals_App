import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function saveFilter;

  Map<String, bool> currentFilter;

  FiltersScreen({required this.currentFilter, required this.saveFilter});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarin = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState(){
    _glutenFree = widget.currentFilter['gluten']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    _vegetarin = widget.currentFilter['vegetarian']!;
    _vegan = widget.currentFilter['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                'gluten':_glutenFree,
                'lactose':_lactoseFree,
                'vegan':_vegan,
                'vegetarian':_vegetarin,
              };
              widget.saveFilter(selectedFilter);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten Free'),
                  subtitle: Text('Only include gluten-free meals.'),
                  value: _glutenFree,
                  onChanged: (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose Free'),
                  subtitle: Text('Only include Lactose-free meals.'),
                  value: _lactoseFree,
                  onChanged: (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include Vegetarian meals.'),
                  value: _vegetarin,
                  onChanged: (newVal) {
                    setState(() {
                      _vegetarin = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('Only include Vegan meals.'),
                  value: _vegan,
                  onChanged: (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
