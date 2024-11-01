import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce65/features/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'LogicApp/ThemeLogic/theme_cubit.dart';
import 'LogicApp/langugue_cubit.dart';
import 'core/di/di.dart';
import 'core/networks/AuthService.dart';
import 'core/sherdprf/sherd.dart';
import 'features/productsscreen/prudct_cubit.dart';
import 'generated/codegen_loader.g.dart';
import 'myApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupGetIt();
  await SharedPrefsHelper.init();
  await checkIfLoggedInUser();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: CodegenLoader(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => LangugueCubit()),
          BlocProvider(
            create: (context) => getIt<PrudctCubit>(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
