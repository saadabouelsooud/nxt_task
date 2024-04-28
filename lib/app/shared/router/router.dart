import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/app/modules/home/home_screen.dart';
import 'package:task/app/modules/reservation/reservation_page.dart';
part 'router.g.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    routes: $appRoutes,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
  );
}

@TypedGoRoute<HomeRoute>(path: '/', name: 'Home')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<ReservationRoute>(path: '/reservation', name: 'Reservation')
class ReservationRoute extends GoRouteData {
  const ReservationRoute();

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      BottomSheetPage();
}
