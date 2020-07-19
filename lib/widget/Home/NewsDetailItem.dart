import 'package:beneventflutter/state.dart' as state;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 7,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 3,
              child: Image(
                image: AssetImage(
                    'lib/assets/logo_benevent.png'),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${state.selectedNews.title}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "le ${DateFormat('dd MMMM yyyy', 'fr_FR').format(
                          state.selectedNews.date)}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
          height: 1,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${state.selectedNews.content}",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
