import 'package:beneventflutter/widget/AppBar.dart';
import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:beneventflutter/widget/Stats/StatsCaller.dart';
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
      appBar: myAppBar('Statistiques', MediaQuery.of(context).size.height/20),
      body: StatsCaller(),
      drawer: BurgerMenu(),
    );
  }
}
