import 'package:flutter/material.dart';

import 'NewBugView.dart';
import 'NewRatingView.dart';

class FeedbackItem extends StatefulWidget {
  @override
  _FeedbackItemState createState() => _FeedbackItemState();
}

class _FeedbackItemState extends State<FeedbackItem> {
  String status = "";
  @override
  Widget build(BuildContext context) {
    return Container(
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
                                'lib/assets/logo_benevent.png'),
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
                    if (status == "imp") NewRatingView(),
                    if (status == "bug") NewBugView(),
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
    );
  }
}
