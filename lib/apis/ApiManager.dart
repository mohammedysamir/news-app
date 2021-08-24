import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
Future<SourceResponse> getNewsSources() async {
  final url= Uri.https('newsapi.org', '/v2/top-headlines/sources',
      {'apiKey': '088c0577b7134716b61deb32f85e69fb'});
  final response = await http.get(url);
  if(response.statusCode==200){
    return SourceResponse.fromJsonMap(jsonDecode(response.body));
  }
  else{
    throw Exception(response.body);
  }

}
Future<NewsResponse> loadnews(Source source)async{
  print("here");
  final url=Uri.https("newsapi.org", "/v2/everything",
      {
        "apiKey":"088c0577b7134716b61deb32f85e69fb",
        "sources": source.id
      }
  );
  final response = await http.get(url);
  if(response.statusCode==200){
    print("success!");
    return NewsResponse.fromJson(jsonDecode(response.body)); // take body convert it to jason and from json to newsresponse class
  }
  else{
    print("in exception");
    throw Exception(response.body);
  }
}