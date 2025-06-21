import 'package:go_router/go_router.dart';
import 'package:template_project/core/errors/unknown_route_view.dart';
import 'package:template_project/core/routes/app_routes.dart';

class RouterGenerator {
  static GoRouter mainRouting = GoRouter(
    initialLocation: AppRoutes.splashView,
    errorBuilder: (context, state) {
      return UnKnownRouteView();
    },
    routes: [
      // GoRoute(
      //   name: AppRoutes.splashView,
      //   path: AppRoutes.splashView,
      //   builder: (context, state) => SplashView(),
      // ),
    ],
  );
}
