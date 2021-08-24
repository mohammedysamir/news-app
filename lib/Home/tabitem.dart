// responsible for the individual tab in the tab menu
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/model/sourceresponse.dart';
// ignore: use_key_in_widget_constructors
class TabItem extends StatelessWidget {
  late Source source;
  late bool isSelected;
  TabItem(this.source,this.isSelected); // constructor
  @override
  Widget build(BuildContext context) {
    return isSelected? Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).primaryColor,
      ),
      child: Text(source.name,
       // ignore: prefer_const_constructors
       style: TextStyle(color:Colors.white ),
      ),
    ):Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).primaryColor,width: 1)
      ),
      child: Text(source.name,
      style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}