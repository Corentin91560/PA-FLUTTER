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
        backgroundColor: Colors.green,
        title: Text('Connexion'),
        actions: <Widget>[
          Center(
            child: Text(
              "${global.name}",
              style: TextStyle(
                fontSize: 16,
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
