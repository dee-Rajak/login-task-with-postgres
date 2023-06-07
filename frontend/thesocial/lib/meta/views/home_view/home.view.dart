import 'package:flutter/material.dart';
import 'package:thesocial/app/routes/app.routes.dart';
import 'package:thesocial/core/services/cache.service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final CacheService cacheService = new CacheService();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home view"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cacheService.deleteCache(key: "jwt").whenComplete(() {
            Navigator.of(context).pushNamed(LoginRoute);
          });
        },
      ),
    );
  }
}
