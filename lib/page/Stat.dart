import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:flutter/material.dart';

class Stat extends StatefulWidget {
  static const routeName = "Stat";

  @override
  _StatState createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Text("test"),
      ),
      drawer: BurgerMenu(),
    );
  }
}
