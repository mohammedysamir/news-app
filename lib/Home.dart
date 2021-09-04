import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/BackgroundPattern.dart';
import 'package:news/Drawer.dart';
import 'package:news/AppConfigProvider.dart';
import 'package:news/News/NewsScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context)!.appTitle),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(45),
          ),
        ),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Stack(
          children: <Widget>[
            BackgroundPattern(),
            Container(
              alignment: Alignment.center,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment:
                              AppConfigProvider.getLanguage() == "ar"
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.pick,
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 79, 90, 105)),
                                textAlign: TextAlign.start),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Category(
                                  AppLocalizations.of(context)!.sports,
                                  'assets/images/sports.png',
                                  false,
                                  Color.fromARGB(255, 201, 28, 34)),
                              Category(
                                  AppLocalizations.of(context)!.technology,
                                  'assets/images/technology.png',
                                  true,
                                  Color.fromARGB(255, 0, 62, 144)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Category(
                                  AppLocalizations.of(context)!.health,
                                  'assets/images/health.png',
                                  false,
                                  Color.fromARGB(255, 237, 30, 121)),
                              Category(
                                  AppLocalizations.of(context)!.business,
                                  'assets/images/business.png',
                                  true,
                                  Color.fromARGB(255, 207, 126, 72)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Category(
                                  AppLocalizations.of(context)!.entertainment,
                                  'assets/images/entertainment.png',
                                  false,
                                  Color.fromARGB(255, 72, 130, 207)),
                              Category(
                                  AppLocalizations.of(context)!.science,
                                  'assets/images/science.png',
                                  true,
                                  Color.fromARGB(255, 242, 211, 82)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
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
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, NewsScreen.routeName,
            arguments: this.categoryName)
      },
      child: Container(
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
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                flex: 1,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
