import 'package:beneventflutter/models/News.dart';
import 'package:beneventflutter/ApiServices.dart';
import 'package:beneventflutter/widget/Home/NewsItem.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
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
                      child: Text("Il n'y a aucune news pour le moment\nRevenez plus tard !"),
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
