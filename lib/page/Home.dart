import 'package:beneventflutter/widget/ActuDisplay.dart';
import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

class Home extends StatefulWidget {
  static const routeName = "Home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Accueil'),
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
      body: ActuDisplay(),
      drawer: BurgerMenu(),
    );
  }
}
