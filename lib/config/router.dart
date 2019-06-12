import 'package:fluro/fluro.dart';
import 'package:ma_voix_app/config/route_handlers.dart';

class FluroRouter {
  static Router router = Router();

  static void setupRouter() {
    /*
    router.define(
      'login',
      handler: loginHandler,
    );
    */
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
