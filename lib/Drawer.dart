import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Home.dart';
import 'package:news/Settings.dart';

class DrawerMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
    child:ListView(children: [
      Container(height: MediaQuery.of(context).size.height*0.2,child: DrawerHeader(child: Center(child: Text('News App!',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),decoration: BoxDecoration(color: Color.fromARGB(255, 57, 165, 82),),))
      ,InkWell(child: ListTile(title: Text('Categories',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),leading: Image.asset('assets/images/list.png'),),onTap: () =>navigateDrawer(context,"Categories"),)
      ,InkWell(child: ListTile(title: Text('Settings',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),leading: Image.asset('assets/images/gear.png'),),onTap: () =>navigateDrawer(context,"Settings"),)
    ],) ,
    );
  }
  void navigateDrawer(BuildContext context,String tileName){
    Navigator.pop(context);
    if(tileName == "Categories")Navigator.pushNamed(context, MyHomePage.routeName);
    if(tileName== "Settings")Navigator.pushNamed(context, Settings.routeName); //implement settings screen
  }
}