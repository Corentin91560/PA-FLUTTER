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
                  StatDetail("Nombre d'événement à venir ", statistique.numbereventnotstarted.toString()),
                  StatDetail("Moyenne d'événement par association ", statistique.averageeventperasso.toStringAsFixed(1)),
                  StatDetail("Moyenne de post par événement ", statistique.averagepostbyevent.toStringAsFixed(1)),
                  StatDetail("Nombre d'événement en cours ", statistique.numbereventinprogress.toString()),
                ],
              ),
              Row(
                children: <Widget>[
                  StatDetail("Nombre D'utilisateur",statistique.numberuser.toString()),
                  StatDetail("Nombre D'association",statistique.numberassociation.toString()),
                  StatDetail("Nombre d'événement fini ", statistique.numbereventended.toString()),
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
