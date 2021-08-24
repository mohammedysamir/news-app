import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String currentLanguage= "en";
  void changeLanguage(String language){
    if(currentLanguage==language)
      return;
    else{
      currentLanguage=language;
      notifyListeners();
    }
  }
}