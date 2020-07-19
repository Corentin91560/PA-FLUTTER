import 'package:beneventflutter/widget/AppBar.dart';
import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:beneventflutter/widget/Contact/ContactCard.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  static const routeName = "Contact";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Contact', MediaQuery.of(context).size.height/20),
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ContactCard("Thomas MARTIN", "www.github.com/SoKaii",
                "lib/assets/logo_benevent.png", "0666666666"),
            ContactCard("Matthieu HABIB", "www.github.com",
                "lib/assets/logo_benevent.png", "0666666666"),
            ContactCard("Corentin DELAGE", "www.github.com",
                "lib/assets/logo_benevent.png", "0666666666"),
          ],
        ),
      ),
      drawer: BurgerMenu(),
    );
  }
}
