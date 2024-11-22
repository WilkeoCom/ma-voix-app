import 'package:flutter/material.dart';
import 'package:ma_voix_app/services/router.dart';
import 'package:ma_voix_app/views/home_view.dart';
import 'package:ma_voix_app/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData getThemeData() {
    ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: const Color.fromARGB(255, 4, 32, 93),
      secondary: const Color.fromARGB(255, 234, 93, 23),
      tertiary: const Color.fromARGB(255, 242, 243, 246),
      surface: Colors.white,
      surfaceTint: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
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
      scaffoldBackgroundColor: colorScheme.tertiary,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Voix',
      theme: getThemeData(),
      initialRoute: homePath,
      routes: {
        homePath: (context) => const HomeView(),
        loginPath: (context) => const LoginView(),
      },
    );
  }
}
