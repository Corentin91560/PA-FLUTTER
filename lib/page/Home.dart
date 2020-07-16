import 'package:beneventflutter/widget/ActuDisplay.dart';
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
      appBar: AppBar(title: Text('Home')),
      body: Actu(),
      drawer: BurgerMenu(),
    );
  }
}
