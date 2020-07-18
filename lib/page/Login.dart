import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:beneventflutter/widget/LoginForm.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

class Login extends StatelessWidget {
  static const routeName = "Login";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff63c173),
        title: Row(
          children: [
            Text(
              'Connexion ',
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
      body: LoginForm(),
      drawer: BurgerMenu(),
    );
  }
}
