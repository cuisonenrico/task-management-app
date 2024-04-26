import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/screens/login_page/login_page_connector.dart';
import 'package:task_management_app/screens/main_page/main_page_connector.dart';
import 'package:task_management_app/state/app_state.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');

final router = GoRouter(
  observers: [routeObservers],
  initialLocation: MainPageConnector.route,
  navigatorKey: rootNavigatorKey,
  redirect: (context, routeState) {
    final state = StoreProvider.state<AppState>(context);
    final isLoggedIn = state?.userState.isLoggedIn == true;

    if (routeState.uri.toString().contains('sign-up-page')) return null;

    if (!isLoggedIn) return LoginPageConnector.route;

    if (routeState.uri.toString() == MainPageConnector.route) return null;

    return routeState.uri.toString();
  },
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
    GoRoute(
      path: LoginPageConnector.route,
      name: LoginPageConnector.routeName,
      builder: (_, state) => const LoginPageConnector(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const LoginPageConnector(),
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
