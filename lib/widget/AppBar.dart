import 'package:flutter/material.dart';
import 'package:beneventflutter/state.dart' as state;

AppBar myAppBar(String title, double imageHeight) {
  return AppBar(
    backgroundColor: Color(0xff63c173),
    title: Row(
      children: [
        Text(
          title,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Image(
              height: imageHeight,
              alignment: Alignment.center,
              image: AssetImage(
                  'lib/assets/logo_benevent.png'),
            ),
          ),
        ),
      ],
    ),
    actions: <Widget>[
      Center(
        child: state.isLoggedIn
            ? Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "${state.name}",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black
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
  );
}