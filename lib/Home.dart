import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/BackgroundPattern.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'News app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            BackgroundPattern(),
            Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Pick your category of interest',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 79, 90, 105)),
                          textAlign: TextAlign.start),
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        Category('Sports', 'assets/images/sports.png', false,
                            Color.fromARGB(255, 201, 28, 34)),
                        Category('Politics', 'assets/images/Politics.png', true,
                            Color.fromARGB(255, 0, 62, 144)),
                        Category('Health', 'assets/images/health.png', false,
                            Color.fromARGB(255, 237, 30, 121)),
                        Category('Business', 'assets/images/business.png', true,
                            Color.fromARGB(255, 207, 126, 72)),
                        Category('Environment', 'assets/images/environment.png',
                            false, Color.fromARGB(255, 72, 130, 207)),
                        Category('Science', 'assets/images/science.png', true,
                            Color.fromARGB(255, 242, 211, 82)),
                      ],
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  String categoryName, imagePath;
  Color color;
  bool isRightCategory;
  double borderRadius = 10.0;

  Category(this.categoryName, this.imagePath, this.isRightCategory, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //if the category is right one then it won't have left border radius and vice versa
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
            bottomLeft: isRightCategory
                ? Radius.circular(0)
                : Radius.circular(borderRadius),
            bottomRight: isRightCategory
                ? Radius.circular(borderRadius)
                : Radius.circular(0)),
      ),
      color: this.color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                this.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Text(this.categoryName),
              flex: 1,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
