import 'package:flutter/material.dart';

class StatItem extends StatefulWidget {
  String text;
  String value;

  StatItem(this.text, this.value);

  @override
  _StatItemState createState() => _StatItemState();
}

class _StatItemState extends State<StatItem>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _controller;
  String i;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: double.parse(widget.value))
        .animate(_controller)
          ..addListener(() {
            setState(() {
              i = animation.value.toStringAsFixed(0);
            });
          });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        color: Color(0xFFD0F6CA),
        child: Column(
          children: <Widget>[
            Center(
                child: Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                "${widget.text}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )),
            Spacer(
              flex: 1,
            ),
            Center(
                child: Text(
              "$i",
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
