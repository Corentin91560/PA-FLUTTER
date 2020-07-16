import 'package:beneventflutter/webservices/ApiServices.dart';
import 'package:beneventflutter/widget/StarDisplay.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              Future<String> message = ApiServices.sendRating(contentimp.text, rating, new DateFormat('yyyy-MM-dd  HH:mm:ss').format(DateTime.now()));
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text(
                      "content :$message"),
                );
              },
            );
          },
          color: Colors.blue,
          textColor: Colors.white,
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
