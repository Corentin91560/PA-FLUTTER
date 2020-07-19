import 'package:beneventflutter/widget/AppBar.dart';
import 'package:beneventflutter/widget/BurgerMenu.dart';
import 'package:beneventflutter/widget/Login/LoginView.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const routeName = "Login";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Connexion', MediaQuery.of(context).size.height/20),
      body: LoginView(),
      drawer: BurgerMenu(),
    );
  }
}
