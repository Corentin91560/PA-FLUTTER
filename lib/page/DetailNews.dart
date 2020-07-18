import 'package:beneventflutter/modele/News.dart';
import 'package:flutter/material.dart';
import 'package:beneventflutter/global.dart' as global;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'Home.dart';

class DetailNews extends StatelessWidget {
  static const routeName = "DetailNews";

  final News news;

  DetailNews({this.news});

  void _goTo(BuildContext context, String name, {dynamic argument}) {
    Navigator.of(context).pushNamed(name, arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff63c173),
        title: Row(
          children: [
            Text(
              'Détail ',
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
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 7,
                height: MediaQuery.of(context).size.height / 3,
                child: Image(
                  image: AssetImage(
                      'lib/ressources/logo_benevent.png'),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "${news.title}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "le ${DateFormat('dd MMMM yyyy','fr_FR').format(news.date)}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "${news.content}",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
