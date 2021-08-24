import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';

class ArticleDetails extends StatelessWidget {
  late Article article;

  ArticleDetails(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(45),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  article.urlToImage,
                  height: 200,
                  fit: BoxFit.fill,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
               Expanded(
                 flex: 3,
                 child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        article.author,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black45),
                      ),
                    ),
               ), Expanded(
                 child: Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        article.publishedAt.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black45),
                      ),
                    ),
               ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 8.0,
          // ),

          Flexible(
              child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              article.content,
              style: TextStyle(fontSize: 20),
            ),
          ))
        ],
      ),
    );
  }
}
