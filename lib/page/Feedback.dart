import 'package:beneventflutter/widget/BugForm.dart';
import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:beneventflutter/widget/ImpForm.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

class FeedBack extends StatefulWidget {
  static const routeName = "Feedback";

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  String status = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('FeedBack'),
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
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.green)),
                              onPressed: () {
                                setState(() {
                                  status = "bug";
                                });
                              },
                              color: Colors.green,
                              textColor: Colors.white,
                              child: Text("Déclarer un Bug".toUpperCase(),
                                  style: TextStyle(fontSize: 14)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.green)),
                              onPressed: () {
                                setState(() {
                                  status = "imp";
                                });
                              },
                              color: Colors.green,
                              textColor: Colors.white,
                              child: Text("Nous Noter".toUpperCase(),
                                  style: TextStyle(fontSize: 14)),
                            ),
                          )
                        ],
                      ),
                      if (status == "imp") ImpForm(),
                      if (status == "bug") BugForm(),
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: BurgerMenu(),
    );
  }
}
