import 'package:flutter/material.dart';
import '../../Features/auth/presentation/screens/login_screen.dart';
import '../../Features/auth/presentation/screens/register_screen.dart';
import '../../Features/auth/presentation/screens/splash_screen.dart';
import '../../Features/layout/presentation/view/layout_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String layoutScreen = '/layout';
}

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case Routes.layoutScreen:
        return MaterialPageRoute(builder: (_) =>  LayoutScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}