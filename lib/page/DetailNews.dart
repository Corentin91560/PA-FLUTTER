import 'package:beneventflutter/models/News.dart';
import 'package:beneventflutter/widget/AppBar.dart';
import 'package:beneventflutter/widget/Home/NewsDetailItem.dart';
import 'package:flutter/material.dart';

class DetailNews extends StatelessWidget {
  static const routeName = "DetailNews";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('Détails', MediaQuery.of(context).size.height / 20),
        body: NewsDetailItem()
    );
  }
}
