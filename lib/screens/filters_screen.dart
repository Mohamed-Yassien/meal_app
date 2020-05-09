import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = 'filters';

  final Function saveFilters;
  final Map <String , bool> filtersMap;

  FiltersScreen(this.filtersMap,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState(){
    _glutenFree = widget.filtersMap['gluten'];
    _lactoseFree = widget.filtersMap['lactose'];
    _vegan = widget.filtersMap['vegan'];
    _vegetarian = widget.filtersMap['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title , String description , bool val , Function handler){
    return SwitchListTile(
      activeColor: Colors.pink,
      title: Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      subtitle: Text(description,style: TextStyle(fontSize: 16,)),
      value: val,
      onChanged: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),onPressed:() {
            final _selectedFilters  = {
              'gluten': _glutenFree,
              'lactose' : _lactoseFree,
              'vegan' : _vegan,
              'vegetarian' : _vegetarian,
            };

            widget.saveFilters(_selectedFilters);
            },)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust Your Meals!',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Glutine-Free', 'only Glutine-free meals.' , _glutenFree, (newVal){
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                _buildSwitchListTile('Lactose-Free', 'only Lactos-free meals.' , _lactoseFree, (newVal){
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                _buildSwitchListTile('Vegan', 'only Vegan meals.' , _vegan, (newVal){
                  setState(() {
                    _vegan = newVal;
                  });
                }),
                _buildSwitchListTile('Vegeterian', 'only Vegeterian meals.' , _vegetarian, (newVal){
                  setState(() {
                    _vegetarian = newVal;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
