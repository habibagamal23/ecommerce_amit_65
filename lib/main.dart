import 'package:ecommerce65/features/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'LogicApp/ThemeLogic/theme_cubit.dart';
import 'core/sherdprf/sherd.dart';
import 'myApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LoginCubit()),
      ],
      child: const MyApp(),
    ),
  );
}
