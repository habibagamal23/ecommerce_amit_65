import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'LogicApp/ThemeLogic/theme_cubit.dart';
import 'LogicApp/langugue_cubit.dart';
import 'core/routs/approuter.dart';
import 'core/routs/routs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        final themeData = themeState.themedate;

        return BlocBuilder<LangugueCubit, LangugueState>(
          builder: (context, languageState) {
            final locale = languageState is LanguageChanged
                ? languageState.locale
                : const Locale('en');

            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Stylish',
                  theme: themeData,
                  locale: locale,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  localeResolutionCallback: (locale, supportedLocales) {
                    return supportedLocales.contains(locale)
                        ? locale
                        : const Locale('en');
                  },
                  initialRoute: Routes.loginScreen,
                  onGenerateRoute: AppRouter.generateRoute,
                );
              },
            );
          },
        );
      },
    );
  }
}
