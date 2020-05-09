import 'package:flutter/material.dart';

import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/category_meals_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String , bool> _filters = {
    'gluten': false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;



  void _setFilters (Map<String,bool> filteredData){
    setState(() {
      _filters = filteredData;

      availableMeals = DUMMY_MEALS.where((meal){
        if (_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  List <Meal> favouriteMeals = [];

  void setFavourite(String mealId){
    final existingIndex = favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >=0 ){
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavourite(String id){
    return favouriteMeals.any((meal) => meal.id == id);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'SourceSansPro',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontSize: 20,fontFamily: 'SourceSansPro',fontWeight: FontWeight.bold),
            ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favouriteMeals),
        FiltersScreen.routeName : (context ) => FiltersScreen(_filters,_setFilters),
        CategoryMealsScreen.routeName : (context)=> CategoryMealsScreen(availableMeals: availableMeals,),
        MealDetail.routeName : (context) => MealDetail(setFavourite: setFavourite, isFavourite: isFavourite,),
      },
    );
  }
}
