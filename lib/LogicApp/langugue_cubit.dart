import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../core/sherdprf/sherd.dart';

part 'langugue_state.dart';

class LangugueCubit extends Cubit<LangugueState> {
  LangugueCubit() : super(LanguageInitial()) {
    loadLanguage();
  }
  void loadLanguage() async {
    String? savedLanguageCode = await SharedPrefsHelper.getLanguage();
    if (savedLanguageCode != null) {
      emit(LanguageChanged(Locale(savedLanguageCode)));
    } else {
      emit(LanguageChanged(Locale('en')));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    Locale newLocale = Locale(languageCode);
    await SharedPrefsHelper.setLanguage(languageCode);
    emit(LanguageChanged(newLocale));
  }
}
