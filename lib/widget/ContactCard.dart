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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Card(
          color: Color(0xFFE1E1E1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Image(
                  image: AssetImage(widget.pictureprofil),
                ),
              ),
              Spacer(),
              Expanded(
                  child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Expanded(
                  child: Text(
                widget.githuburl,
              )),
              Expanded(
                  child: Text(
                widget.phone,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
