import 'package:flutter/material.dart';
import 'package:pii6/features/auth/sign_in/sign_in_view.dart';
import 'package:pii6/features/new_document/list/add_document/add_document.dart';
import 'package:pii6/features/splash/splash_view.dart';
import '../features/auth/login/login_view.dart';
import '../features/new_document/list/list.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;
    switch (settings.name) {
      case '/':
        {
          return doNavigation(
            page: const SplashView(),
          );
        }
      case '/login':
        {
          return doNavigation(
            page: const LoginView(),
          );
        }
      case '/sign-in':
        {
          return doNavigation(
            page: const SignInView(),
          );
        }
      case '/list':
        {
          return doNavigation(
            page: ListFromDb(),
          );
        }
      case '/add_document':
        {
          return doNavigation(
            page: const AddDocument(),
          );
        }

      default:
        {
          return doNavigation(
            page: const SplashView(),
          );
        }
    }
  }

  static PageRouteBuilder<
      Widget Function(
    BuildContext,
    Animation<double>,
    Animation<double>,
  )> doNavigation({required Widget page}) {
    return PageRouteBuilder<RoutePageBuilder>(
      pageBuilder:
          (BuildContext c, Animation<double> a1, Animation<double> a2) => page,
      transitionsBuilder: (BuildContext c, Animation<double> anim,
              Animation<double> a2, Widget child) =>
          FadeTransition(
        opacity: anim,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 1000),
    );
  }
}
