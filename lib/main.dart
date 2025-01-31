import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ma_voix_app/auth/screens/login_screen.dart';
import 'package:ma_voix_app/firebase_options.dart';
import 'package:ma_voix_app/services/router.dart';
import 'package:ma_voix_app/screens/home_screen.dart';
import 'package:ma_voix_app/auth/screens/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData getThemeData() {
    const primaryColor = Color.fromARGB(255, 4, 32, 93);
    const secondaryColor = Color.fromARGB(255, 234, 93, 23);
    const tertiaryColor = Color.fromARGB(255, 242, 243, 246);
    const inputColor = Color(0xFFFBFBFB);
    const double defaultPadding = 16;

    // Text Field Decoration
    OutlineInputBorder kDefaultOutlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(
        color: primaryColor.withOpacity(0.2),
      ),
    );

    const kErrorBorderSide = BorderSide(color: secondaryColor, width: 1);

    final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      fillColor: inputColor,
      filled: true,
      contentPadding: const EdgeInsets.all(defaultPadding),
      border: kDefaultOutlineInputBorder,
      enabledBorder: kDefaultOutlineInputBorder,
      focusedBorder: kDefaultOutlineInputBorder.copyWith(
        borderSide: const BorderSide(color: primaryColor),
      ),
      errorBorder: kDefaultOutlineInputBorder.copyWith(
        borderSide: kErrorBorderSide,
      ),
      focusedErrorBorder: kDefaultOutlineInputBorder.copyWith(
        borderSide: kErrorBorderSide,
      ),
    );

    const ButtonThemeData buttonThemeData = ButtonThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );

    ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: tertiaryColor,
      surface: Colors.white,
      surfaceTint: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      colorScheme: colorScheme,
      textTheme: const TextTheme(
        headlineMedium:
            TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
        headlineSmall: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor),
        titleLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
        bodySmall: TextStyle(color: Color.fromARGB(255, 147, 147, 147)),
      ),
      scaffoldBackgroundColor: colorScheme.primary,
      inputDecorationTheme: inputDecorationTheme,
      buttonTheme: buttonThemeData,
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
        loginPath: (context) => const LoginScreen(),
        profilePath: (context) => ProfileScreen(),
      },
    );
  }
}
