import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:setup/screens/main_page/main_page_connector.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');

final router = GoRouter(
  observers: [routeObservers],
  initialLocation: MainPageConnector.route,
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: MainPageConnector.route,
      name: MainPageConnector.routeName,
      builder: (_, state) => const MainPageConnector(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const MainPageConnector(),
      ),
      routes: const [],
    ),
  ],
);

// Register the RouteObserver as a navigation observer.
final RouteObserver<ModalRoute<void>> routeObservers = RouteObserver<ModalRoute<void>>();

CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (_, animation, __, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child),
    );
