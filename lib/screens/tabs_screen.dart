import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/favourite_screen.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>favouriteMeals;

  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String,Object>> pages;

  @override
  initState(){
    pages = [
      {'page': CategoriesScreen() , 'title' : 'Categories'},
      {'page' : FavouriteScreen(widget.favouriteMeals) , 'title' : 'Your Facourite'}
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        onTap: _selectedPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.category),
            title: Text('Ctegories'),
          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.star),
            title: Text('Favourite'),
          ),
        ],
      ),

    );
  }
}
