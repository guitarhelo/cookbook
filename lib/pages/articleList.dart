import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cookbook/model/newsArticle.dart';
import 'package:cookbook/services/webservice.dart';
import 'package:cookbook/utils/constants.dart';

class ArticleListState extends State<ArticleList> {

  List<NewsArticle> _newsArticles = List<NewsArticle>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  void _populateNewsArticles() {

    Webservice().load(NewsArticle.bitcoin).then((newsArticles) => {
      setState(() => {
        _newsArticles = newsArticles
      })
    });

  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: _newsArticles[index].urlToImage == null ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL) : Image.network(_newsArticles[index].urlToImage),
      subtitle: Text(_newsArticles[index].title, style: TextStyle(fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.builder(
          itemCount: _newsArticles.length,
          itemBuilder: _buildItemsForListView,
        )
    );
  }
}

class ArticleList extends StatefulWidget {

  @override
  createState() => ArticleListState();
}