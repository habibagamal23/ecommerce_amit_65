import 'package:ecommerce65/core/routs/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/logic/home_cubit.dart';
import '../../features/home/ui/homescreen.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/loginscreen.dart';
import '../../features/productsscreen/productscreen.dart';
import '../../features/productsscreen/prudct_cubit.dart';
import '../../features/splash/splsh.dart';
import '../di/di.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: Loginscreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const Homescreen(),
          ),
        );

      case Routes.productDtailes:
        return MaterialPageRoute(
          builder: (_) => const ProductGrid(),
        );

      default:
        return null;
    }
  }
}
