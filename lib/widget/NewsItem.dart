import 'package:beneventflutter/modele/News.dart';
import 'package:beneventflutter/page/DetailNews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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
    initializeDateFormatting();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Color(0xFFE2E2E2),
        child: ListTile(
          title: Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
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
                  side: BorderSide(color: Color(0xff6fd680))),
              color: Color(0xff6fd680),
              textColor: Colors.white,
              onPressed: () {
                _goTo(context, DetailNews.routeName, argument: news);
              },
              child: Text("Voir plus"),
            ),
          ),
          trailing: Text(
            "${DateFormat('dd MMMM yyyy','fr_FR').format(news.date)}",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
