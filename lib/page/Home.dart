import 'package:beneventflutter/widget/Home/Feed.dart';
import 'package:beneventflutter/widget/AppBar.dart';
import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = "Home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Accueil', MediaQuery.of(context).size.height/20),
      body: Feed(),
      drawer: BurgerMenu(),
    );
  }
}
