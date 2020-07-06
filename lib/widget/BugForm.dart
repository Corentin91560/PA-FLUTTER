import 'package:flutter/material.dart';

class BugForm extends StatefulWidget {

  @override
  _BugFormState createState() => _BugFormState();
}

class _BugFormState extends State<BugForm> {
  final objectbug = TextEditingController();
  final contentbug = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    objectbug.dispose();
    contentbug.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Report Bug'),
        Card(
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: objectbug,
              maxLength: 50,
              maxLines: 1,
              decoration: InputDecoration.collapsed(
                  hintText: "Object of your report"),
            ),
          ),
        ),
        Card(
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: contentbug,
              maxLength: 255,
              maxLines: 8,
              decoration: InputDecoration.collapsed(
                  hintText: "Content of your report"),
            ),
          ),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.blue)),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text("object : ${objectbug.text}\ncontent :${contentbug.text} "),
                );
              },
            );
          },
          color: Colors.blue,
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
