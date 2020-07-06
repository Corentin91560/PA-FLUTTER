import 'package:beneventflutter/widget/StarDisplay.dart';
import 'package:flutter/material.dart';

class ImpForm extends StatefulWidget {
  @override
  _ImpFormState createState() => _ImpFormState();
}

class _ImpFormState extends State<ImpForm> {
  int rating = 0;

  final objectimp = TextEditingController();
  final contentimp = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    objectimp.dispose();
    contentimp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Send an improvement'),
        Card(
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: objectimp,
              maxLength: 50,
              maxLines: 1,
              decoration: InputDecoration.collapsed(
                  hintText: "Object of your Improvement"),
            ),
          ),
        ),
        Card(
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: contentimp,
              maxLength: 255,
              maxLines: 8,
              decoration: InputDecoration.collapsed(
                  hintText: "Content of your improvement"),
            ),
          ),
        ),
        IconTheme(
          data: IconThemeData(
            color: Colors.blue,
            size: 48,
          ),
          child: StarRating(
            onChanged: (index) {
              setState(() {
                rating = index;
              });
            },
            value: rating,
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
                  content: Text("object : ${objectimp.text}\ncontent :${contentimp.text} \nvalue : $rating"),
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
