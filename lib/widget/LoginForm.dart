import 'package:beneventflutter/page/Feedback.dart';
import 'package:beneventflutter/webservices/ApiServices.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final email = TextEditingController();
  final password = TextEditingController();

  void _goTo(BuildContext context, String name, {dynamic argument}) {
    Navigator.of(context).pushNamed(name, arguments: argument);
  }

  final objectimp = TextEditingController();
  final contentimp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image(
          image: AssetImage('lib/ressources/logo_benevent.png'),
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 4,
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: TextField(
              controller: email,
              maxLines: 1,
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: Colors.grey[800]),
                  hintText: "Email",
                  fillColor: Colors.white70),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: password,
                maxLines: 1,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Mot de passe",
                    fillColor: Colors.white70),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: RaisedButton(
              onPressed: () async {
                await ApiServices.LoginUser(email.text, password.text);
                if (global.isLoggedIn) {
                  _goTo(context, FeedBack.routeName);
                } else {
                  await ApiServices.LoginAsso(email.text, password.text);
                  if (global.isLoggedIn) {
                    _goTo(context, FeedBack.routeName);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          content: Text(
                            "Veuillez verifier vos identifiants",
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      },
                    );
                  }
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0xff6fd680)),
              ),
              color: Color(0xff6fd680),
              textColor: Colors.white,
              child: Text(
                "Connexion",
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
