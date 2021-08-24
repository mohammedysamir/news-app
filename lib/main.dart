import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:news/Home/home_screen.dart';
void main() {
  runApp(MyApp());
}
class MyThemeData {
  static final Color primaryColor = Color.fromARGB(255, 57, 165, 82);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 // https://newsapi.org/v2/everything?sources=BBC-news&apiKey=088c0577b7134716b61deb32f85e69fb
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primaryColor: MyThemeData.primaryColor,
      ),
      routes: {
        HomePage.ROUTE_NAME: (context) => HomePage(),
      },
      initialRoute: HomePage.ROUTE_NAME,
    );
  }
}
