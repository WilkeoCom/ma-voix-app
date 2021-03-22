import 'package:flutter/material.dart';
import 'package:ma_voix_app/config/router.dart' as Router;

void main() {
  Router.Router.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Voix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      onGenerateRoute: Router.Router.router.generator,
    );
  }
}
