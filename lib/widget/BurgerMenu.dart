import 'package:beneventflutter/page/Contact.dart';
import 'package:beneventflutter/page/Feedback.dart';
import 'package:beneventflutter/page/Home.dart';
import 'package:beneventflutter/page/Login.dart';
import 'package:beneventflutter/page/Stat.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;

class BurgerMenu extends StatelessWidget {
  void _goTo(BuildContext context, String name, {dynamic argument}) {
    Navigator.of(context).pushNamed(name, arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: <Widget>[
                Text(
                  'BENEVENT',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  flex: 2,
                  child: Image(
                    image: AssetImage('lib/ressources/logo_benevent.png'),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xff6fd680),
            ),
          ),
          ListTile(
            title: Text('ACCUEIL'),
            onTap: () {
              Navigator.pop(context);
              _goTo(context, Home.routeName);
            },
          ),
          ListTile(
            title: Text('STATISTIQUES'),
            onTap: () {
              Navigator.pop(context);
              _goTo(context, Stat.routeName);
            },
          ),
          ListTile(
            title: Text('CONTACT'),
            onTap: () {
              Navigator.pop(context);
              _goTo(context, Contact.routeName);
            },
          ),
          ListTile(
            title: Text('FEEDBACK'),
            onTap: () {
              Navigator.pop(context);
              _goTo(context, FeedBack.routeName);
            },
          ),
          global.isLoggedIn
              ? ListTile(
                  title: Text('SE DECONNECTER'),
                  onTap: () {
                    global.isLoggedIn = false;
                    global.isUser = false;
                    global.name = "";
                    global.id = 0;
                    Navigator.pop(context);
                    _goTo(context, Home.routeName);
                  },
                )
              : ListTile(
                  title: Text('SE CONNECTER'),
                  onTap: () {
                    Navigator.pop(context);
                    _goTo(context, Login.routeName);
                  },
                ),
        ],
      ),
    );
  }
}
