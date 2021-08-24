import 'package:flutter/material.dart';
import 'package:news/model/newsresponse.dart';
InkWell NewListItem(Article article) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // (article.urlToImage == null ? Container() : ClipRRect(
            //     borderRadius: BorderRadius.circular(12),
            //     child: Image.network(
            //         article.urlToImage,
            //         height: 120,
            //         fit: BoxFit.cover
            //     ))),
                Text(
                  article.title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black54
                  ), ),
                Text(article.description,maxLines: 2,overflow: TextOverflow.ellipsis),
                Text(article.publishedAt,textAlign: TextAlign.end,
                style:TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black54
                  ), ),
          ],
        ),),
    );
  }