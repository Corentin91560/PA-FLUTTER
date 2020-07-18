import 'package:beneventflutter/modele/News.dart';
import 'package:beneventflutter/page/DetailNews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({
    Key key,
    this.news,
  }) : super(key: key);


  void _goTo(BuildContext context, String name, {dynamic argument}) {
    Navigator.of(context).pushNamed(name, arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFC9C9CF),
      child: ListTile(
        title: Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
          child: Text(
            "${news.title}",
            style: TextStyle(fontSize: 32),
          ),
        ),
        subtitle: Align(
          alignment: Alignment.centerLeft,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.green)),
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () {
              _goTo(context, DetailNews.routeName, argument: news.content);
            },
            child: Text("Voir plus"),
          ),
        ),
        trailing: Text(
          "${news.date.substring(0, 10)}",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}