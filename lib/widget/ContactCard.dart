import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  String name;
  String githuburl;
  String pictureprofil;
  String phone;

  ContactCard(this.name, this.githuburl, this.pictureprofil, this.phone);

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue,
          onTap: () {
            print('Card tapped.');
          },
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Image(
                  image: AssetImage(widget.pictureprofil),
                ),
              ),
              Spacer(flex: 1,),
              Expanded(flex: 1,child: Text(widget.name)),
              Expanded(flex: 1,child: Text(widget.githuburl)),
              Expanded(flex: 1,child: Text(widget.phone)),
            ],
          ),
        ),
      ),
    );
  }
}
