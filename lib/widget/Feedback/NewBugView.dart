import 'package:beneventflutter/ApiServices.dart';
import 'package:beneventflutter/page/Login.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:beneventflutter/state.dart' as state;

class NewBugView extends StatefulWidget {
  @override
  _NewBugViewState createState() => _NewBugViewState();
}

class _NewBugViewState extends State<NewBugView> {
  final titlebug = TextEditingController();
  final contentbug = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titlebug.dispose();
    contentbug.dispose();
    super.dispose();
  }

  void _goTo(BuildContext context, String name, {dynamic argument}) {
    Navigator.of(context).pushNamed(name, arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Déclarer un bug'),
        Card(
          color: Color(0xFFE2E2E2),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: titlebug,
              maxLength: 50,
              maxLines: 1,
              decoration:
                  InputDecoration.collapsed(hintText: "Titre de votre rapport"),
            ),
          ),
        ),
        Card(
          color: Color(0xFFE2E2E2),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: contentbug,
              maxLength: 255,
              maxLines: 8,
              decoration: InputDecoration.collapsed(hintText: "Commentaire"),
            ),
          ),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
              color: Colors.black,
            ),
          ),
          onPressed: () {
            if (state.isLoggedIn) {
              Future<String> message = ApiServices.sendBug(
                  titlebug.text,
                  contentbug.text,
                  new DateFormat('yyyy-MM-dd  HH:mm:ss')
                      .format(DateTime.now()));
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text("content :$message"),
                  );
                },
              );
            } else {
              _goTo(context, Login.routeName);
            }
          },
          color: Color(0xffec9595),
          textColor: Colors.black,
          child: Column(
            children: <Widget>[
              Text("Send".toUpperCase(), style: TextStyle(fontSize: 14)),
              Icon(Icons.send),
            ],
          ),
        )
      ],
    );
  }
}
