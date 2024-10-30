part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final ThemeData themedate;
  ThemeState(this.themedate);
}

final class ThemInitial extends ThemeState {
  ThemInitial(ThemeData lightTheme) : super(lightTheme);
}

final class ThemChanged extends ThemeState {
  ThemChanged(ThemeData themedata) : super(themedata);
}
