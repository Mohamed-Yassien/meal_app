import 'package:flutter/material.dart';
import 'package:mealapp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  
  Widget _buildListTile(IconData icon , String title,Function selectHandler){
    return ListTile(
      leading: Icon(icon,size: 26,),
      title: Text(title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      onTap: selectHandler,
      
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            child: Text('COOKING UP!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
          SizedBox(height: 20,),
          _buildListTile(Icons.restaurant, 'Meals', (){
            Navigator.pushReplacementNamed(context, '/');
          }),
          _buildListTile(Icons.settings, 'Filters', (){
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
