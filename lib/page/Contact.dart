import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:beneventflutter/widget/ContactCard.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

class Contact extends StatelessWidget {
  static const routeName = "Contact";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Contact'),
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
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ContactCard("Thomas MARTIN", "www.github.com",
                "lib/ressources/logo_benevent.png", "0666666666"),
            ContactCard("Matthieu HABIB", "www.github.com",
                "lib/ressources/logo_benevent.png", "0666666666"),
            ContactCard("Corentin DELAGE", "www.github.com",
                "lib/ressources/logo_benevent.png", "0666666666"),
          ],
        ),
      ),
      drawer: BurgerMenu(),
    );
  }
}
