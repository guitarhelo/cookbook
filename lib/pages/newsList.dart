import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cookbook/model/newsArticle.dart';
import 'package:cookbook/services/webservice.dart';
import 'package:cookbook/utils/constants.dart';

class NewsListState extends State<NewsList> {

  List<NewsArticle> _newsArticles = List<NewsArticle>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles(widget.articleType);
  }

  void _populateNewsArticles(String articleType) {
    print('You have got $articleType as result');
    switch (articleType) {
      case "All":
        {
          Webservice().load(NewsArticle.all).then((newsArticles) =>
          {
            setState(() =>
            {
              _newsArticles = newsArticles
            })
          });
        }
        break;

      case "ai":
        {
          Webservice().load(NewsArticle.ai).then((newsArticles) =>
          {
            setState(() =>
            {
              _newsArticles = newsArticles
            })
          });
        }
        break;

      case "bitcoin":
        {
          Webservice().load(NewsArticle.bitcoin).then((newsArticles) =>
          {
            setState(() =>
            {
              _newsArticles = newsArticles
            })
          });
        }
        break;

      case "bigdata":
        {
          Webservice().load(NewsArticle.bigdata).then((newsArticles) =>
          {
            setState(() =>
            {
              _newsArticles = newsArticles
            })
          });
        }
        break;
      case "Top":
        {
          Webservice().load(NewsArticle.top).then((newsArticles) =>
          {
            setState(() =>
            {
              _newsArticles = newsArticles
            })
          });
        }
        break;

      default:
        {
          Webservice().load(NewsArticle.all).then((newsArticles) =>
          {
            setState(() =>
            {
              _newsArticles = newsArticles
            })
          });
        }
        break;
    }
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

class NewsList extends StatefulWidget {

  const NewsList({ Key key,this.articleType }) : super(key: key);
  final String articleType;
  @override
  NewsListState createState() => NewsListState();
}