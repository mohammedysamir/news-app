import 'package:flutter/material.dart';
import 'package:news/BackgroundPattern.dart';
import 'package:news/Drawer.dart';
import 'package:news/News/HomeTabScreen.dart';
import 'package:news/apis/ApiManager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final args=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        //AppLocalizations.of(context)!.appTitle
        title: Text(args),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(45),
          ),
        ),
      ),
      drawer: Drawer(
        child: DrawerMenu(),
      ),
      body: Stack(
        children:[
          BackgroundPattern(),
          FutureBuilder<SourceResponse>(
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
        ]
      ),

    );
  }

}