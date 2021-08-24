/// Parsing the news articles 
class NewsResponse {
   String status='';
   int totalResults=0;
   List<Article> articles=[];
   NewsResponse(this.status,this.totalResults,this.articles);
   factory NewsResponse.fromJson(Map<String, dynamic> map){
     print("in fromJson1");
     String status = map["status"];
     print("in fromJson2");
     int totalResults = map["totalResults"];
     print("in fromJson3");
     List<Article> articles = List<Article>.from(map["articles"].map((it) => Article.fromJsonMap(it)));
     print("in fromJson4");
     return NewsResponse(status, totalResults, articles);
  }

     
    
}

class Article {
    SSource source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    String publishedAt;
    String content;

     Article.fromJsonMap(Map<String, dynamic> map):
     source=SSource.fromJson(map["source"]),
     author=map["author"],
     title=map["title"],
     description=map["description"],
     url=map["url"],
     urlToImage=map["urlToImage"],
     publishedAt=map["publishedAt"],
     content=map["content"];
}
class SSource{
  String name;
  String id;
  SSource(
      { required this.id,
        required this.name,
      }
      );

  factory SSource.fromJson(Map<String, dynamic> map) {
    return SSource(
      id: map['id'],
      name: map['name'],
    );
  }

}


