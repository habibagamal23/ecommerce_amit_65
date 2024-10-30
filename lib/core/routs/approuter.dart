import 'package:ecommerce65/core/routs/routs.dart';
import 'package:flutter/material.dart';

import '../../features/login/ui/loginscreen.dart';
import '../../features/splash/splsh.dart';



class AppRouter {

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) =>  Loginscreen(),
        );


      default:
        return null;
    }
  }
}