import 'package:flutter/material.dart';
import '../../Features/auth/presentation/screens/login_screen.dart';
import '../../Features/auth/presentation/screens/register_screen.dart';
import '../../Features/auth/presentation/screens/splash_screen.dart';
import '../../Features/layout/presentation/view/layout_screen.dart';
import '../../Features/profile/presentation/view/edit_profile.dart';
import '../../Features/profile/presentation/view/profile_view.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String layoutScreen = '/layout';
  static const String profileScreen = '/profile';
  static const String editProfileScreen = '/editProfile';
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

      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}