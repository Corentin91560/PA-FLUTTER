import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:beneventflutter/widget/ContactCard.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  static const routeName = "Contact";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ContactCard("Thomas", "www.github.com",
                "lib/ressources/logo_benevent.png", "0666666666"),
            ContactCard("Matthieu", "www.github.com",
                "lib/ressources/logo_benevent.png", "0666666666"),
            ContactCard("Corentin", "www.github.com",
                "lib/ressources/logo_benevent.png", "0666666666"),
          ],
        ),
      ),
      drawer: BurgerMenu(),
    );
  }
}
