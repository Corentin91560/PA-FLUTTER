import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

import 'Home.dart';

class DetailNews extends StatelessWidget {
  static const routeName = "DetailNews";

  final String content;

  DetailNews({String this.content});

  void _goTo(BuildContext context, String name, {dynamic argument}) {
    Navigator.of(context).pushNamed(name, arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: (){
            _goTo(context, Home.routeName);
          },
        ),
        backgroundColor: Colors.green,
        title: Text('Detail'),
        actions: <Widget>[
          Center(
            child: global.isLoggedIn
                ? Text(
                    "${global.name}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                : Text(
                    "Vous n'etes pas encore connecté",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          color: Color(0xFFC9C9CF),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "$content",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
