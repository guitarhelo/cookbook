import 'package:flutter/material.dart';
import 'package:cookbook/pages/newsList.dart';
import 'package:cookbook/pages/articleList.dart';
import 'package:cookbook/pages/articleList3.dart';

class CodePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new AppBar(
          title:
          Row(

            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 4.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset("assets/images/logo/linkedin-logo.png"),
                ),
              ),


              Flexible(
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black12,
                        ),
                      ),
                      Flexible(
                        child: TextField(

                          style: TextStyle(
                            color: Colors.white,
                            height: 1.2,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Cari Orang",
                            hintStyle: TextStyle(
                              color: Color(0xFFE1E9EE),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(
                text: "Java",
              ),
              new Tab(
                text: "Javascript",
              ),
              new Tab(
                text: "Python",
              ),
              new Tab(
                text: "C",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NewsList(),
            ArticleList(),
            ArticleList(),
            ArticleList3(),
          ],
        ),
      ),
    );
  }
}