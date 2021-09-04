import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/AppConfigProvider.dart';
import 'package:news/Home.dart';
import 'package:news/Settings.dart';
import 'package:provider/provider.dart';
import 'package:news/News/NewsScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future main()async{  WidgetsFlutterBinding.ensureInitialized();await AppConfigProvider.init();runApp(SplashWidget());}
class SplashWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AppConfigProvider(),
      builder: (context,widget) {
        final provider = Provider.of<AppConfigProvider>(context);
        return MaterialApp(
          title: 'News App',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale.fromSubtags(languageCode: AppConfigProvider.getLanguage() ),
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            MyHomePage.routeName: (context) => MyHomePage(title: 'News App'),
            Settings.routeName: (context) => Settings(title: 'Settings'),
            NewsScreen.routeName:(context)=>NewsScreen()
          },
          initialRoute: SplashScreen.routeName,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      }
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
              child: Image.asset("assets/images/splash.png", fit: BoxFit.fill),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height:MediaQuery
                  .of(context)
                  .size
                  .height,
            ),
          ],
        ));
  }
}