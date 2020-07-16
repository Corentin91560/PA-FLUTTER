import 'package:beneventflutter/modele/News.dart';
import 'package:beneventflutter/webservices/ApiServices.dart';
import 'package:beneventflutter/widget/NewsItem.dart';
import 'package:flutter/material.dart';

class Actu extends StatefulWidget {
  @override
  _ActuState createState() => _ActuState();
}

class _ActuState extends State<Actu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Center(
        child: FutureBuilder(
          future: ApiServices.getNews(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                }
                if (snapshot.hasData) {
                  final List<News> newslist = snapshot.data;
                  if (newslist.isEmpty) {
                    return Center(
                      child: Text("Il n'y a aucune news pour le moment\nrevenez plus tard !"),
                    );
                  }
                  return ListView.builder(
                    itemCount: newslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsItem(
                        news: newslist[index],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("Aucune donnée n'a été récupéré"),
                  );
                }
                break;
              default:
                return Container();
                break;
            }
          },
        ),
      ),
    );
  }
}
