import 'package:flutter/material.dart';
import 'package:ma_voix_app/routes/route_type.dart';
import 'package:ma_voix_app/routes/separated/auth_routes.dart';
import 'package:ma_voix_app/screens/home_screen.dart';

import 'app_routes.dart';
import 'slide_route.dart';

class Routes {
  static Map<String, RouteType> _resolveRoutes() {
    return {
      AppRoutes.home: (context, settings) => const HomeView(),
      ...authRoutes,
    };
  }

  static Route onGenerateRoutes(RouteSettings settings) {
    var routes = _resolveRoutes();

    try {
      final child = routes[settings.name];

      Widget builder(BuildContext c) => child!(c, settings);

      /*
      if (settings.name == AppRoutes.home) {
        return MaterialPageRoute(
          builder: builder,
        );
      }
      */

      return SlideRoute(
        builder: builder,
        startOffset: const Offset(1, 0),
        endOffset: Offset.zero,
      );
    } catch (e) {
      throw const FormatException("--- Route doesn't exist");
    }
  }
}
