import 'package:flutter/material.dart';
import 'package:thesocial/core/services/cache.service.dart';
import 'package:thesocial/meta/views/authentication/login.view.dart';
import 'package:thesocial/meta/views/authentication/signup.view.dart';
import 'package:thesocial/meta/views/home_view/home.view.dart';
import 'package:thesocial/meta/views/splash_view/splash.view.dart';

class DeciderView extends StatelessWidget {
  const DeciderView({super.key});

  @override
  Widget build(BuildContext context) {
    final CacheService cacheService = new CacheService();
    return FutureBuilder(
      future: cacheService.readCache(key: "jwt"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashView();
        }
        if (snapshot.hasData) {
          return HomeView();
        } else {
          return SignupView();
        }
      },
    );
  }
}
