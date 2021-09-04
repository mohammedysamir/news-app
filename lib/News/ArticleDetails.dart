import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  late final Article article;

  ArticleDetails(this.article);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(
        context); //used to identify current language
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
                ),
                Expanded(
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
          Flexible(
              child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              article.content,
              style: TextStyle(fontSize: 20),
            ),
          )),
          Spacer(),
          Container(
            alignment: provider.currentLanguage == "en"
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              InkWell(
                onTap: ()=>{
                  print('tap on link'),
                  launch(article.url)
                },
                child: Text(AppLocalizations.of(context)!.viewArticle,
                    style: TextStyle(
                        color: Color.fromRGBO(66, 80, 92, 1), fontSize: 14)),
              ),
              Icon(
                Icons.arrow_right,
                color: Color.fromRGBO(66, 80, 92, 1),
              )
            ]),
          )
        ],
      ),
    );
  }
}
