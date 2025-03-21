import 'package:ma_voix_app/auth/screens/login_screen.dart';
import 'package:ma_voix_app/auth/screens/profile_screen.dart';
import 'package:ma_voix_app/auth/screens/sign_up_screen.dart';
import 'package:ma_voix_app/routes/route_type.dart';

import '../app_routes.dart';

Map<String, RouteType> authRoutes = {
  AppRoutes.login: (context, settings) => const LoginScreen(),
  AppRoutes.signup: (context, settings) => const SignUpScreen(),
  AppRoutes.profile: (context, settings) => ProfileScreen(),
};
