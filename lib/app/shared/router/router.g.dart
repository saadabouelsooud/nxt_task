// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $reservationRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      name: 'Home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $reservationRoute => GoRouteData.$route(
      path: '/reservation',
      name: 'Reservation',
      factory: $ReservationRouteExtension._fromState,
    );

extension $ReservationRouteExtension on ReservationRoute {
  static ReservationRoute _fromState(GoRouterState state) =>
      const ReservationRoute();

  String get location => GoRouteData.$location(
        '/reservation',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
