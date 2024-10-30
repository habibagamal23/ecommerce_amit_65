part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess(this.token);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

final class LoginpassToggle extends LoginState {
  final bool isPassvisable;
  LoginpassToggle(this.isPassvisable);

}