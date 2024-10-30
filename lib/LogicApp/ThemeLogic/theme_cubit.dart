import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../core/sherdprf/sherd.dart';
import '../../core/utils/styles.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemInitial(AppThemes.darkTheme)) {
    getTheme();
  }

  Future saveTheme(Brightness brightness) async {
    final themeindex = brightness == Brightness.light ? 0 : 1;
    await SharedPrefsHelper.setTheme(themeindex);
  }

  Future getTheme() async {
    var savedindex = await SharedPrefsHelper.getTheme();
    if (savedindex == 0) {
      emit(ThemChanged(AppThemes.lightTheme));
    } else {
      emit(ThemChanged(AppThemes.darkTheme));
    }
  }

  void Toggle() {
    if (state.themedate.brightness == Brightness.light) {
      emit(ThemChanged(AppThemes.darkTheme));
      saveTheme(Brightness.dark);
    } else {
      emit(ThemChanged(AppThemes.lightTheme));
      saveTheme(Brightness.light);
    }
  }
}
