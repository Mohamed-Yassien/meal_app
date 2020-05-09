import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List <Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty){
      return Scaffold(
        body: Center(child: Text('No Favourite Items .. Add Some!'),),
      );
    } else{
      return Scaffold(
        body: ListView.builder(itemBuilder: (context,index){
          return MealItem(
            id : favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },itemCount:favouriteMeals.length ),
      );
    }
  }
}
