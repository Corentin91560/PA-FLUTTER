import 'package:beneventflutter/page/Login.dart';
import 'package:beneventflutter/webservices/ApiServices.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:beneventflutter/global.dart' as global;

class BugForm extends StatefulWidget {

  @override
  _BugFormState createState() => _BugFormState();
}

class _BugFormState extends State<BugForm> {
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
        Text('Reporter un bug'),
        Card(
          color: Color(0xFFC9C9CF),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: titlebug,
              maxLength: 50,
              maxLines: 1,
              decoration: InputDecoration.collapsed(
                  hintText: "Titre de votre rapport"),
            ),
          ),
        ),
        Card(
          color: Color(0xFFC9C9CF),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: contentbug,
              maxLength: 255,
              maxLines: 8,
              decoration: InputDecoration.collapsed(
                  hintText: "contenue de votre rapport"),
            ),
          ),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.green)),
          onPressed: () {
            if (global.isLoggedIn) {
            Future<String> message = ApiServices.sendBug(titlebug.text, contentbug.text, new DateFormat('yyyy-MM-dd  HH:mm:ss').format(DateTime.now()));
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
          color: Colors.green,
          textColor: Colors.white,
          child: Column(
            children: <Widget>[
              Text("Send".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
              Icon(Icons.send),
            ],
          ),
        )
      ],
    );
  }
}
