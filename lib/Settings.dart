import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/BackgroundPattern.dart';
import 'package:news/Drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  Settings({Key? key, required this.title}) : super(key: key);
  final String title;
  static String routeName = 'Settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static late String language;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);
    language=provider.currentLanguage=="en"?'English':'العربية';
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.settings),
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(AppLocalizations.of(context)!.language,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 79, 90, 105)),
                        textAlign: TextAlign.start),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45.0, 0, 45.0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 57, 165, 82),
                                style: BorderStyle.solid,
                                width: 2),
                          ),
                          child: DropdownButton<String>(
                            value: language,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconEnabledColor: Color.fromARGB(255, 57, 165, 82),
                            iconSize: 24,
                            isExpanded: true,
                            elevation: 16,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 57, 165, 82)),
                            onChanged: (String? newValue) {
                              setState(() {
                                language = newValue!;
                                if(language == 'English')
                                provider.changeLanguage("en");
                                else provider.changeLanguage("ar");
                              });
                            },
                            items: <String>['English', 'العربية']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
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
