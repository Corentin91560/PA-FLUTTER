import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:beneventflutter/widget/StatDisplay.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

class Stat extends StatefulWidget {
  static const routeName = "Stat";

  @override
  _StatState createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff63c173),
        title: Row(
          children: [
            Text(
              'Statistiques ',
            ),
            Container(
              child: Image(
                height: MediaQuery.of(context).size.height / 20 ,
                alignment: Alignment.center,
                image: AssetImage(
                    'lib/ressources/logo_benevent.png'),
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
      body: StatDisplay(),
      drawer: BurgerMenu(),
    );
  }
}
