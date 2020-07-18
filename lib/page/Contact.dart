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
        backgroundColor: Color(0xff63c173),
        title: Row(
          children: [
            Text(
              'Contact ',
            ),
            Container(
              child: Image(
                height: MediaQuery.of(context).size.height / 20,
                alignment: Alignment.center,
                image: AssetImage('lib/ressources/logo_benevent.png'),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Center(
            child: global.isLoggedIn
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${global.name}",
                      style: TextStyle(
                        fontSize: 16,
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
