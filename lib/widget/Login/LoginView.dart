import 'LoginForm.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image(
          image: AssetImage('lib/assets/logo_benevent.png'),
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 4,
        ),
        LoginForm(),
        Spacer(),
      ],
    );
  }
}
