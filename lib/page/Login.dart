import 'package:beneventflutter/page/Feedback.dart';
import 'package:beneventflutter/webservices/ApiServices.dart';
import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

class Login extends StatelessWidget {
  static const routeName = "Login";
  final email = TextEditingController();
  final password = TextEditingController();

  void _goTo(BuildContext context, String name, {dynamic argument}) {
    Navigator.of(context).pushNamed(name, arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: <Widget>[
          TextField(
            controller: email,
            maxLines: 1,
            decoration: InputDecoration.collapsed(hintText: "Email"),
          ),
          TextField(
            controller: password,
            maxLines: 1,
            decoration: InputDecoration.collapsed(hintText: "Password"),
          ),
          Center(
              child: RaisedButton(
            onPressed: () async {
              await ApiServices.LoginUser(email.text, password.text);
              if (global.isLoggedIn) {
                _goTo(context, FeedBack.routeName);
              } else {
                await ApiServices.LoginAsso(email.text, password.text);
                if (global.isLoggedIn) {
                  _goTo(context, FeedBack.routeName);
                }
              }
            },
            child: Text(
              "Connexion",
            ),
          )),
        ],
      ),
      drawer: BurgerMenu(),
    );
  }
}
