import 'package:flutter/material.dart';
import 'package:news/News/NewsFragment.dart';
import 'package:news/News/TabItem.dart';
import 'package:news/model/SourceResponse.dart';
// ignore: use_key_in_widget_constructors
class HomeTabs  extends StatefulWidget {
  final List<Source> sources;
  HomeTabs(this.sources);
  @override
  _HomeTabsState createState() => _HomeTabsState();
}
class _HomeTabsState extends State<HomeTabs> {
  int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    // print(widget.sources);
    return DefaultTabController(
      length:widget.sources.length ,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TabBar(
              onTap: (index){

                print(index);
                setState(() {
                  selectedindex=index;
                });
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs:widget.sources.map((source) => TabItem(source,widget.sources.indexOf(source)==selectedindex)).toList(),
            ),
            Expanded(
                child: TabBarView(
                  children: widget.sources.map((source) => NewsFragment(source)).toList(),
                ) ),],
        ), ),);
  }}