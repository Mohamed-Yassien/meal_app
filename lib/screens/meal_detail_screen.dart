import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealDetail extends StatelessWidget {

  static const routeName = 'meal-detail';


  final Function setFavourite;
  final Function isFavourite;
  MealDetail({this.setFavourite ,this.isFavourite});



  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal){
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text('Ingradients',style: Theme.of(context).textTheme.title,),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 220,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              child: ListView.builder(itemBuilder: (context,index){
                return Card(
                  color: Colors.pink,
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedMeal.ingredients[index],style: TextStyle(color: Colors.white),),
                  ),
                );
              },itemCount: selectedMeal.ingredients.length,),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text('Steps',style: Theme.of(context).textTheme.title,),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              child: ListView.builder(itemBuilder: (context,index){
                return Column(
                  children: <Widget>[
                ListTile(
                leading: CircleAvatar(
                    child: Text('# ${index+1}'),
                  backgroundColor: Colors.pink,
                ),
                title: Text(selectedMeal.steps[index]),
                ),
                    Divider(height: 2,),
                  ],
                );
              },itemCount: selectedMeal.ingredients.length,),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          (isFavourite(mealId))? Icons.star : Icons.star_border,
        ),
        onPressed: () =>setFavourite(mealId),
      ),
    );
  }
}
