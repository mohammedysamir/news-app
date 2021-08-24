import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  static late SharedPreferences sharedPreferences; //1. declare sharedPref object

  static Future init() async{
    sharedPreferences = await SharedPreferences.getInstance(); //2. init sharedPref object
  }
  String currentLanguage= "en";
  void changeLanguage(String language){
    if(currentLanguage==language)
      return;
    else{
      currentLanguage=language;
      saveLanguage(language);
      notifyListeners();
    }
  }
  static Future saveLanguage(String language) async{
    sharedPreferences.setString("Language", language);
  }

  static String getLanguage(){
    return sharedPreferences.getString("Language").toString();
  }

}