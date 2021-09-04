import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/News/ArticleDetails.dart';

InkWell NewListItem(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ArticleDetails(article)),
      );
    },
    child: Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: article.urlToImage!='null'? Image.network(
                article.urlToImage,
                height: 240,
                fit: BoxFit.cover,
              ):Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1200px-No-Image-Placeholder.svg.png',height: 240,fit:BoxFit.fitHeight,
    )
          ),
          Text(
            article.source.name,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontSize: 14),
          ),
          Text(
            article.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            article.publishedAt.toString(),
            textAlign: TextAlign.end,
            style:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
          ),
        ],
      ),
    ),
  );
}
