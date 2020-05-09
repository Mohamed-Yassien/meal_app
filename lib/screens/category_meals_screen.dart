import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {

  final List<Meal> availableMeals;
  CategoryMealsScreen({this.availableMeals});

  static const routeName = 'categroy-meals';
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

   List<Meal> displayedItems;
   bool isLoaded = false;
   String title;

  @override
  void didChangeDependencies() {
    if (!isLoaded){
      final args = ModalRoute.of(context).settings.arguments as Map<String,String>;
      final String categoryId = args['id'];
      title = args['title'];
      displayedItems = widget.availableMeals.where((meal){
        return meal.categories.contains(categoryId);
      }).toList();
      isLoaded = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String id){
    setState(() {
      displayedItems.removeWhere((meal){
        return meal.id == id;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return MealItem(
          id : displayedItems[index].id,
          title: displayedItems[index].title,
          imageUrl: displayedItems[index].imageUrl,
          duration: displayedItems[index].duration,
          complexity: displayedItems[index].complexity,
          affordability: displayedItems[index].affordability,
        );
      },itemCount:displayedItems.length ),
    );
  }
}
