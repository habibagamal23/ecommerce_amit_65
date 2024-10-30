part of 'langugue_cubit.dart';

@immutable
sealed class LangugueState {}

class LanguageInitial extends LangugueState {
  LanguageInitial();
}

class LanguageChanged extends LangugueState {
  final Locale locale;
  LanguageChanged(this.locale);
}
