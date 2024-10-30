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

  LoginCubit() : super(LoginInitial());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool ispass = false;

  void togglepass() {
    ispass = !ispass;
    emit(LoginpassToggle(ispass));
  }



  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    // TODO: implement close
    return super.close();
  }
}
