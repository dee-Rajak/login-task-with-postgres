import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/app/providers/provider.dart';
import 'package:thesocial/app/routes/app.routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'theSocial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.green,
      ),
      initialRoute: DeciderRoute,
      routes: routes,
    );
  }
}
