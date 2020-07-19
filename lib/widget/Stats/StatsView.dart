import 'package:beneventflutter/models/Statistique.dart';
import 'package:beneventflutter/widget/Stats/StatItem.dart';
import 'package:flutter/material.dart';

class StatsView extends StatelessWidget {
  final Statistique statistique;

  const StatsView({
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
                  StatItem(" Nombre d'événements à venir", statistique.numbereventnotstarted.toString()),
                  StatItem(" Nombre moyen d'événements par association", statistique.averageeventperasso.toStringAsFixed(1)),
                  StatItem(" Moyenne de posts par événement", statistique.averagepostbyevent.toStringAsFixed(1)),
                  StatItem(" Nombre d'événements en cours", statistique.numbereventinprogress.toString()),
                ],
              ),
              Row(
                children: <Widget>[
                  StatItem(" Nombre d'utilisateurs",statistique.numberuser.toString()),
                  StatItem(" Nombre d'associations",statistique.numberassociation.toString()),
                  StatItem(" Nombre d'événements finis", statistique.numbereventended.toString()),
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
