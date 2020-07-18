import 'dart:convert';

import 'package:beneventflutter/modele/Association.dart';
import 'package:beneventflutter/modele/News.dart';
import 'package:beneventflutter/modele/Statistique.dart';
import 'package:beneventflutter/modele/User.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:beneventflutter/global.dart' as global;
import 'package:crypto/crypto.dart';

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

  static sendBug(String title, String content, String date) async {
    String url = _url + "feedback/bug";
    Map<String, String> headers = {"Content-type": "application/json"};
    content = content.replaceAll('"', '\'\'');
    String json;
    if (global.isUser) {
      json =
          '{"title": "$title", "content": "$content", "date": "$date", "platform": "FLUTTER", "idtype": 1,"iduser": ${global.id}}'; // make POST request
    } else {
      json =
          '{"title": "$title", "content": "$content", "date": "$date", "platform": "FLUTTER", "idtype": 1,"idassociation": ${global.id}}'; // make POST request
    }
    Response response = await http.post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      global.resultimp = true;
    } else {
      global.resultimp = false;
    }
  }

  static sendRating(String content, int note, String date) async {
    String url = _url + "feedback/rating";
    Map<String, String> headers = {"Content-type": "application/json"};
    content = content.replaceAll('"', '\'\'');
    String json;
    if (global.isUser) {
      json =
          '{"content": "$content", "note": $note, "date": "$date", "platform": "FLUTTER", "idtype": 2, "iduser": ${global.id}}';
    } else {
      json =
          '{"content": "$content", "note": $note, "date": "$date", "platform": "FLUTTER", "idtype": 2, "idassociation": ${global.id}}';
    }
    // make POST request
    Response response = await http.post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      global.resultimp = true;
    } else {
      global.resultimp = false;
    }
  }

  static Future<List<Statistique>> getStatistiques() async {
    final response = await http.get(_url + "statistic");
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<Statistique> statslist = [];
    statslist.addAll(
        (jsonBody as List).map((stat) => Statistique.fromJson(stat)).toList());

    return statslist;
  }

  static LoginUser(String email, String password) async {
    String url = _url + "signin/user";
    Map<String, String> headers = {"Content-type": "application/json"};
    var cryptpass = generateMd5(password);
    String sendjson =
        '{"email": "$email", "password": "$cryptpass"}'; // make POST request
    print(sendjson);
    Response response = await http.post(url, headers: headers, body: sendjson);
    int statusCode = response.statusCode;
    print(statusCode);
    if (statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<User> connecteduser = [];
      connecteduser.addAll(
          (jsonBody as List).map((user) => User.fromJson(user)).toList());
      global.isLoggedIn = true;
      global.isUser = true;
      global.name = connecteduser[0].name;
      global.id = connecteduser[0].id;
      print(global.name);
    }
  }

  static LoginAsso(String email, String password) async {
    String url = _url + "signin/association";
    Map<String, String> headers = {"Content-type": "application/json"};
    var cryptpass = generateMd5(password);
    String sendjson =
        '{"email": "$email", "password": "$cryptpass"}'; // make POST request
    print(sendjson);
    Response response = await http.post(url, headers: headers, body: sendjson);
    int statusCode = response.statusCode;
    print(statusCode);
    if (statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<Association> connectedasso = [];
      connectedasso.addAll((jsonBody as List)
          .map((asso) => Association.fromJson(asso))
          .toList());
      global.isLoggedIn = true;
      global.name = connectedasso[0].name;
      global.id = connectedasso[0].id;
      print(global.name);
    }
  }
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
