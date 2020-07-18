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
        backgroundColor: Color(0xff63c173),
        title: Row(
          children: [
            Text(
              'Feedback ',
            ),
            Container(
              child: Image(
                height: MediaQuery.of(context).size.height / 20 ,
                alignment: Alignment.center,
                image: AssetImage(
                    'lib/ressources/logo_benevent.png'),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Center(
            child: global.isLoggedIn
                ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "${global.name}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
                : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Vous n'êtes pas encore connecté",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 300,
                            child: Image(
                              image: AssetImage(
                                  'lib/ressources/logo_benevent.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.black)),
                              onPressed: () {
                                setState(() {
                                  status = "bug";
                                });
                              },
                              color: Color(0xffec9595),
                              textColor: Colors.white,
                              child: Text("Déclarer un Bug".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.black)),
                              onPressed: () {
                                setState(() {
                                  status = "imp";
                                });
                              },
                              color: Color(0xffece495),
                              textColor: Colors.white,
                              child: Text("Nous Noter".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
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
