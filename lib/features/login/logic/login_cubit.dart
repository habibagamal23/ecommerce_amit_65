import 'package:bloc/bloc.dart';
import 'package:ecommerce65/core/sherdprf/sherd.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/networks/AuthService.dart';
import '../model/loginreqbody.dart';
import '../model/loginrespone.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;

  LoginCubit(this._authService) : super(LoginInitial());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool ispass = false;

  void togglepass() {
    ispass = !ispass;
    emit(LoginpassToggle(ispass));
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(LoginLoading());
    try {
      final loginBody = LoginRequestBody(
        username: usernameController.text,
        password: passwordController.text,
      );

      final LoginResponse? response = await _authService.login(loginBody);

      if (response != null) {
        await SharedPrefsHelper.setToken(response.token);

        emit(LoginSuccess(response.token));
      } else {
        emit(LoginFailure("Login failed. Invalid username or password."));
      }
    } catch (e) {
      emit(LoginFailure("Login error: ${e.toString()}"));
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    // TODO: implement close
    return super.close();
  }
}
