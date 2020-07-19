import 'package:beneventflutter/widget/AppBar.dart';
import 'package:beneventflutter/widget/Feedback/FeedbackItem.dart';
import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  static const routeName = "Feedback";

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Feedback', MediaQuery.of(context).size.height/20),
      body: FeedbackItem(),
      drawer: BurgerMenu(),
    );
  }
}
