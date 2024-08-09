import 'package:flutter/material.dart';
import 'package:ma_voix_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData getThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        primary: const Color.fromARGB(255, 4, 32, 93),
        secondary: const Color.fromARGB(255, 234, 93, 23),
        surface: Colors.white,
        surfaceTint: Colors.white,
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 4, 32, 93)),
        titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 4, 32, 93)),
        bodySmall: TextStyle(color: Color.fromARGB(255, 147, 147, 147)),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 4, 32, 93),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Voix',
      theme: getThemeData(),
      home: const HomeView(),
    );
  }
}
