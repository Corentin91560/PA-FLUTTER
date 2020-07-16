import 'package:beneventflutter/modele/News.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({
    Key key,
    this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: ListTile(
        title: Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
          child: Text(
            "${news.title}",
            style: TextStyle(fontSize: 32),
          ),
        ),
        subtitle: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 20),
            child: Text(
              "${news.content}",
              style: TextStyle(fontSize: 20),
            )),
        trailing: Text(
          "${news.date.substring(0, 10)}",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
