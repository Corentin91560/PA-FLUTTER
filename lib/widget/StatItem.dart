import 'package:beneventflutter/modele/Statistique.dart';
import 'package:beneventflutter/widget/StatDetail.dart';
import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final Statistique statistique;

  const StatItem({
    Key key,
    this.statistique,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  StatDetail(" Nombre d'événements à venir", statistique.numbereventnotstarted.toString()),
                  StatDetail(" Nombre moyen d'événements par association", statistique.averageeventperasso.toStringAsFixed(1)),
                  StatDetail(" Moyenne de posts par événement", statistique.averagepostbyevent.toStringAsFixed(1)),
                  StatDetail(" Nombre d'événements en cours", statistique.numbereventinprogress.toString()),
                ],
              ),
              Row(
                children: <Widget>[
                  StatDetail(" Nombre d'utilisateurs",statistique.numberuser.toString()),
                  StatDetail(" Nombre d'associations",statistique.numberassociation.toString()),
                  StatDetail(" Nombre d'événements finis", statistique.numbereventended.toString()),
                ],
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}
