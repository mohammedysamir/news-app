import 'package:flutter/material.dart';
import 'package:news/Home/newslistitem.dart';
import 'package:news/apis/apimanger.dart';
import 'package:news/model/newsresponse.dart';
import 'package:news/model/sourceresponse.dart';
// ignore: must_be_immutable
class NewsFragment extends StatefulWidget {
  NewsFragment(this.source);
  final Source source;

  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  late Future<NewsResponse> newsfuture;
  @override
  void initState() {
    super.initState();
    print(widget.source.id);
    newsfuture=loadnews(widget.source);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: newsfuture,
        // ignore: non_constant_identifier_names
        builder: (buildContext,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.articles.length,
              itemBuilder: (context,index){
              return NewListItem(snapshot.data!.articles[index]);
            });
          }
          else if(snapshot.hasError){
          print(snapshot.error);
           return Center(
             child: ElevatedButton(
               onPressed: (){
                 setState(() {
                   newsfuture=loadnews(widget.source);
                 });
               },
           child: Text('RELOAD'),
           
             ),
           );
          }
          return Center (
            child: CircularProgressIndicator(),
          );
        },
        ),
      
    );
  }
}