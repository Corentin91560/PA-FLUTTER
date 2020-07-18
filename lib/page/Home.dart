import 'package:beneventflutter/widget/ActuDisplay.dart';
import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

class Home extends StatefulWidget {
  static const routeName = "Home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff63c173),
        title: Row(
          children: [
            Text(
              'Accueil ',
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
      body: ActuDisplay(),
      drawer: BurgerMenu(),
    );
  }
}
