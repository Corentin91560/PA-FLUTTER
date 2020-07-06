import 'dart:convert';

import 'package:beneventflutter/modele/User.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<User>> getUsers() async {
    final response =
    await http.get("https://next.json-generator.com/api/json/get/NyC4XoSvu?delay=2000");
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<User> users = [];
    users.addAll((jsonBody as List).map((user) => User.fromJson(user)).toList());

    return users;
  }
}