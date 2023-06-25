import 'dart:convert';

import 'package:http/http.dart' as http;

class Auth {
  String baseurl = "https://reqres.in/";

  Future<String?> signup(String email, String password) async {
    dynamic res = await http.post(Uri.parse("https://reqres.in/api/register"),
        body: jsonEncode({"email": email, "password": password}),
        headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 200) {
      var result = jsonDecode(res.body);
      print(result);
      return result["token"];
    } else {
      print(res.body);
      return null;
    }
  }

  Future<String?> signIn(String email, String password) async {
    dynamic res = await http.post(Uri.parse("https://reqres.in/api/login"),
        body: jsonEncode({"email": email, "password": password}),
        headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 200) {
      var result = jsonDecode(res.body);
      print(result);
      return result["token"];
    } else {
      print(res.body);
      return null;
    }
  }
}
