import 'package:beneventflutter/modele/Statistique.dart';
import 'package:beneventflutter/webservices/ApiServices.dart';
import 'package:flutter/material.dart';

import 'StatItem.dart';

class StatDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      child: Center(
        child: FutureBuilder(
          future: ApiServices.getStatistiques(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                  final List<Statistique> statslist = snapshot.data;
                  if (statslist.isEmpty) {
                    return Center(
                      child: Text("Il n'y a aucune statistique pour le moment\n"
                          "Revenez plus tard !"),
                    );
                  }
                  return ListView.builder(
                    itemCount: statslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return StatItem(
                        statistique: statslist[index],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("Aucune donnée n'a été récupérée"),
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
