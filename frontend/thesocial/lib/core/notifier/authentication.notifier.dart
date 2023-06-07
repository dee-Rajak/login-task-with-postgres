import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thesocial/app/routes/app.routes.dart';
import 'package:thesocial/core/api/authentication.api.dart';
import 'package:thesocial/core/services/cache.service.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationAPI _authenticationAPI = new AuthenticationAPI();
  final CacheService cacheService = new CacheService();

  Future signup({
    required BuildContext context,
    required String username,
    required String useremail,
    required String userpassword,
    required String userimage,
  }) async {
    try {
      var userData = await _authenticationAPI.signUp(
          username: username,
          useremail: useremail,
          userpassword: userpassword,
          userimage: userimage);
      final Map<String, dynamic> parsedValue = await json.decode(userData);
      final userJwt = parsedValue['message'];
      final userCode = parsedValue['code'];
      if (userCode == 201) {
        cacheService.writeCache(key: "jwt", value: userJwt);
        Navigator.of(context).pushNamed(HomeRoute);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(userJwt)));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something went wrong.")));
    }
  }

  Future login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userData =
          await _authenticationAPI.login(email: email, password: password);
      final Map<String, dynamic> parsedValue = await json.decode(userData);
      final userJwt = parsedValue['message'];
      final userCode = parsedValue['code'];
      if (userCode == 201) {
        cacheService.writeCache(key: "jwt", value: userJwt);
        Navigator.of(context).pushNamed(HomeRoute);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(userJwt)));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something went wrong.")));
    }
  }
}
