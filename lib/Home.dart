import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/BackgroundPattern.dart';

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
  static String routeName = 'Home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(45),
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            BackgroundPattern(),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Pick your category\nof interest',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 79, 90, 105)),
                        textAlign: TextAlign.start),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Category('Sports', 'assets/images/sports.png',
                                false, Color.fromARGB(255, 201, 28, 34)),
                            Category('Politics', 'assets/images/Politics.png',
                                true, Color.fromARGB(255, 0, 62, 144)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Category('Health', 'assets/images/health.png',
                                false, Color.fromARGB(255, 237, 30, 121)),
                            Category('Business', 'assets/images/business.png',
                                true, Color.fromARGB(255, 207, 126, 72)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Category(
                                'Environment',
                                'assets/images/environment.png',
                                false,
                                Color.fromARGB(255, 72, 130, 207)),
                            Category('Science', 'assets/images/science.png',
                                true, Color.fromARGB(255, 242, 211, 82)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String categoryName, imagePath;
  final Color color;
  final bool isRightCategory;
  final double borderRadius = 25.0;

  Category(this.categoryName, this.imagePath, this.isRightCategory, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 170,
      decoration: BoxDecoration(
        //if the category is right one then it won't have left border radius and vice versa
        color: this.color,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                this.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Text(
                this.categoryName,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
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
