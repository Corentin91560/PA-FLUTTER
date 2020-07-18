import 'package:beneventflutter/page/DetailNews.dart';
import 'package:beneventflutter/page/Login.dart';
import 'package:flutter/material.dart';

import 'page/Contact.dart';
import 'page/Home.dart';
import 'page/Screen404.dart';
import 'page/Stat.dart';
import 'page/Feedback.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Benevent',
      routes: {
        "/": (BuildContext context) => Home(),
        Stat.routeName: (BuildContext context) => Stat(),
        Home.routeName: (BuildContext context) => Home(),
        Contact.routeName: (BuildContext context) => Contact(),
        FeedBack.routeName:(BuildContext context)=> FeedBack(),
        Login.routeName:(BuildContext context)=> Login(),
        },
      onGenerateRoute: (RouteSettings settings) {
        final dynamic arguments = settings.arguments;
        switch (settings.name) {
          case DetailNews.routeName:
            String content;
            if (arguments is String) {
              content = arguments;
            }
            return MaterialPageRoute(
              builder: (BuildContext context) => DetailNews(
                content: content,
              ),
            );
            break;
          default:
            return MaterialPageRoute(builder: (BuildContext context) => Screen404());
            break;
        }
      },
    );
  }
}
