import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:ma_voix_app/config/router.dart';
=======
import 'package:ma_voix_app/bloc_helpers/blocProvider.dart';
import 'package:ma_voix_app/counter/blocs/incrementBloc.dart';

import 'pages/login.dart';
>>>>>>> feat(login): create login widget

void main() {
  FluroRouter.setupRouter();
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
      onGenerateRoute: FluroRouter.router.generator,
    );
  }
}
