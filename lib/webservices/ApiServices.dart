import 'dart:convert';

import 'package:beneventflutter/modele/News.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  //static String _url = "http://localhost:3000/";
  static String _url = "https://benevent-esgi.herokuapp.com/";

  static Future<List<News>> getNews() async {
    final response = await http.get(_url + "news");
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<News> newslist = [];
    newslist
        .addAll((jsonBody as List).map((news) => News.fromJson(news)).toList());

    return newslist;
  }

  static Future<String> sendBug(
      String title, String content, String date) async {
    String message = "";
    String url = _url + "feedback/bug";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"title": "$title", "content": $content, "date": "$date", "platform": "FLUTTER", "idtype": 1}'; // make POST request
    Response response = await http.post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      message = "Votre retour a bien été pris en compte";
    } else {
      message = "Une erreur est survenue \nCode d'erreur $statusCode";
    }
    return message;
  }

  static Future<String> sendRating(
      String content, int note, String date) async {
    String message = "";
    String url = _url + "feedback/rating";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"content": "$content", "note": $note, "date": "$date", "platform": "FLUTTER", "idtype": 2}'; // make POST request
    Response response = await http.post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      message = "Votre retour a bien été pris en compte";
    } else {
      message = "Une erreur est survenue \nCode d'erreur $statusCode";
    }
    return message;
  }
}
