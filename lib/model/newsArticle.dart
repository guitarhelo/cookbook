import 'dart:convert';
import 'package:cookbook/services/webservice.dart';
import 'package:cookbook/utils/constants.dart';

class NewsArticle {

  final String title;
  final String descrption;
  final String urlToImage;

  NewsArticle({this.title, this.descrption, this.urlToImage});

  factory NewsArticle.fromJson(Map<String,dynamic> json) {
    return NewsArticle(
        title: json['title'],
        descrption: json['description'],
        urlToImage: json['urlToImage'] ?? Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL
    );

  }

  static Resource<List<NewsArticle>> get top {

    return Resource(
        url: Constants.HEADLINE_NEWS_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['articles'];
          return list.map((model) => NewsArticle.fromJson(model)).toList();
        }
    );

  }

  static Resource<List<NewsArticle>> get all {

    return Resource(
        url: Constants.HEADLINE_NEWS_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['articles'];
          return list.map((model) => NewsArticle.fromJson(model)).toList();
        }
    );

  }
  static Resource<List<NewsArticle>> get bitcoin {

    return Resource(
        url: Constants.BitCoin_NEWS_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['articles'];
          return list.map((model) => NewsArticle.fromJson(model)).toList();
        }
    );

  }

  static Resource<List<NewsArticle>> get ai {

    return Resource(
        url: Constants.AI_NEWS_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['articles'];
          return list.map((model) => NewsArticle.fromJson(model)).toList();
        }
    );

  }

  static Resource<List<NewsArticle>> get bigdata {

    return Resource(
        url: Constants.AI_NEWS_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['articles'];
          return list.map((model) => NewsArticle.fromJson(model)).toList();
        }
    );

  }
}