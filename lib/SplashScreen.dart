import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/Home.dart';
import 'package:news/Settings.dart';
void main() => runApp(SplashWidget());

class SplashWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        SplashScreen.routeName:(context)=>SplashScreen(),
        MyHomePage.routeName:(context)=>MyHomePage(title:'News App'),
        Settings.routeName:(context)=>Settings(title: 'Settings'),
      },
      initialRoute: SplashScreen.routeName,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName='Splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  route() {
    Navigator.pushNamed(context, MyHomePage.routeName);
  }

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            () => Navigator.pushReplacement(context, route()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              child: Image.asset("assets/images/pattern.png", fit: BoxFit.fill),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 200.0, 8.0, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logo.png"),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/route.png"),
                              Text(
                                "supervised by Mohamed Nabil",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 57, 165, 82),
                                  fontSize: 18,
                                ),
                              )
                            ]),
                      )
                    ]),
              ),
            ),
          ],
        ));
  }
}