import 'package:flutter/material.dart';
class BackgroundPattern extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/pattern.png',fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height);
  }
}