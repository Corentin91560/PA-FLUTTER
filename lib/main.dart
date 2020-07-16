import 'package:flutter/material.dart';

import 'page/Contact.dart';
import 'page/Home.dart';
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
        /*},
      onGenerateRoute: (RouteSettings settings) {
        final dynamic arguments = settings.arguments;
        switch (settings.name) {
          case ScreenC.routeName:
            int identifier;
            if (arguments is int) {
              identifier = arguments;
            }
            return MaterialPageRoute(
              builder: (BuildContext context) => ScreenC(
                identifier: identifier,
              ),
            );
            break;
          default:
            return MaterialPageRoute(builder: (BuildContext context) => Screen404());
            break;
        }*/
      },
    );
  }
}
