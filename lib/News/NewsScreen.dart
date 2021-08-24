import 'package:flutter/material.dart';
import 'package:news/Drawer.dart';
import 'package:news/News/HomeTabScreen.dart';
import 'package:news/apis/ApiManager.dart';
import 'package:news/model/SourceResponse.dart';
class NewsScreen extends StatefulWidget {
  static const routeName="News";

  @override
  _NewsScreenState createState() => _NewsScreenState();
}
class _NewsScreenState extends State<NewsScreen> {
  late Future<SourceResponse> newsfuture;
  @override
  void initState() {
    super.initState();
    newsfuture=getNewsSources();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        shape: ContinuousRectangleBorder(
          // ignore: prefer_const_constructors
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80)
            ) ),
        // ignore: prefer_const_constructors
        title: Text('Route News',
          // ignore: prefer_const_constructors
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),
        ),
        centerTitle:true,
      ),
      drawer: Drawer(
        child: DrawerMenu(),
      ),
      body: FutureBuilder<SourceResponse>(
        future: newsfuture,
        builder: (buildContext,snapShot){
          if(snapShot.hasData){
            print('DATA');
            return HomeTabs(snapShot.data!.sources);
          }
          else if(snapShot.hasError){
            print('NO DATA');
            return Text('error loading data');
          }

          return Center(child: CircularProgressIndicator());

        },
      ),

    );
  }

}