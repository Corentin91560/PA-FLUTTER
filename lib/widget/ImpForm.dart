import 'package:beneventflutter/page/Login.dart';
import 'package:beneventflutter/webservices/ApiServices.dart';
import 'package:beneventflutter/widget/StarDisplay.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:beneventflutter/global.dart' as global;

class ImpForm extends StatefulWidget {
  @override
  _ImpFormState createState() => _ImpFormState();
}

class _ImpFormState extends State<ImpForm> {
  int rating = 0;

  final objectimp = TextEditingController();
  final contentimp = TextEditingController();

  void _goTo(BuildContext context, String name, {dynamic argument}) {
    Navigator.of(context).pushNamed(name, arguments: argument);
  }

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
        Text('Nous Noter'),
        IconTheme(
          data: IconThemeData(
            color: Color(0xffffe800),
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
        Card(
          color: Color(0xFFE2E2E2),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: contentimp,
              maxLength: 255,
              maxLines: 8,
              decoration: InputDecoration.collapsed(
                  hintText: "Contenu de votre commentaire"),
            ),
          ),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black),
          ),
          onPressed: () async {
            if (global.isLoggedIn) {
              await ApiServices.sendRating(
                  contentimp.text,
                  rating,
                  new DateFormat('yyyy-MM-dd  HH:mm:ss')
                      .format(DateTime.now()));
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text("Merci de votre retour"),
                  );
                },
              );
            } else {
              _goTo(context, Login.routeName);
            }
          },
          color: Color(0xffece495),
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
