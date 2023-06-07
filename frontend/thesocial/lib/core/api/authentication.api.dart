import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thesocial/app/routes/api.routes.dart';

class AuthenticationAPI {
  final client = http.Client();

  Future signUp({
    required String username,
    required String useremail,
    required String userpassword,
    required String userimage,
  }) async {
    final String subUrl = "/user/signup";
    final Uri uri = Uri.parse(APIRoutes.BaseURL + subUrl);
    print(uri);
    final http.Response response = await client.post(uri,
        body: jsonEncode({
          "username": username,
          "useremail": useremail,
          "userpassword": userpassword,
          "userimage": userimage
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
        });
    final statusCode = response.statusCode;
    final body = response.body;
    print(body);
    if (statusCode == 200) {
      print(body);
      return body;
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    final String subUrl = "/user/login";
    final Uri uri = Uri.parse(APIRoutes.BaseURL + subUrl);
    print(uri);
    final http.Response response = await client.post(uri,
        body: jsonEncode({"useremail": email, "userpassword": password}),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
        });
    final statusCode = response.statusCode;
    final body = response.body;
    if (statusCode == 200) {
      print(body);
      return body;
    }
  }
}
