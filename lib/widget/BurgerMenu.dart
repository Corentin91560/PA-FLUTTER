import 'package:beneventflutter/page/Contact.dart';
import 'package:beneventflutter/page/Feedback.dart';
import 'package:beneventflutter/page/Home.dart';
import 'package:beneventflutter/page/Stat.dart';
import 'package:flutter/material.dart';

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
                Expanded(
                  flex: 2,
                  child: Image(
                    image: AssetImage('lib/ressources/logo_benevent.png'),
                  ),
                ),
                Text('Benevent'),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              _goTo(context, Home.routeName);
            },
          ),
          ListTile(
            title: Text('Statistics'),
            onTap: () {
              Navigator.pop(context);
              _goTo(context, Stat.routeName);
            },
          ),
          ListTile(
            title: Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              _goTo(context, Contact.routeName);
            },
          ),
          ListTile(
            title: Text('FeedBack'),
            onTap: () {
              Navigator.pop(context);
              _goTo(context, FeedBack.routeName);
            },
          )
        ],
      ),
    );
  }
}
