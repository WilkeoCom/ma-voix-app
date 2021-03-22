import 'package:fluro/fluro.dart';
import 'package:ma_voix_app/config/route_handlers.dart';

class Router {
  static FluroRouter router = FluroRouter();

  static void setupRouter() {
    router.define(
      'login',
      handler: loginHandler,
    );
    router.define(
      'register',
      handler: registerHandler,
    );
    router.define(
      'home',
      handler: homeHandler,
    );
    router.define(
      'project/:projectId',
      handler: projectHandler,
    );
  }
}
