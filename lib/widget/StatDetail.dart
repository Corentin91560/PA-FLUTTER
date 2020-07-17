import 'package:flutter/material.dart';

class StatDetail extends StatelessWidget {
  String text;
  String value;

  StatDetail(this.text, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Card(
        child: Column(
          children: <Widget>[
            Center(
                child: Text(
              "$text",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            )),
            Spacer(
              flex: 1,
            ),
            Center(
                child: Text(
              "${value}",
              style: TextStyle(
                fontSize: 64,
              ),
            )),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
