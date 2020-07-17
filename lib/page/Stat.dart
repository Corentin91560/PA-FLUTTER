import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:beneventflutter/widget/StatDisplay.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

class Stat extends StatefulWidget {
  static const routeName = "Stat";

  @override
  _StatState createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
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
      body: StatDisplay(),
      drawer: BurgerMenu(),
    );
  }
}
