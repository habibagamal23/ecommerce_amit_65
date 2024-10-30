import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/appregx.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/textfieldcutom.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../logic/login_cubit.dart';

class EmailAndPassword extends StatelessWidget {
  EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return Form(
      key: loginCubit.formKey,
      child: Column(
        children: [
          CustomFormTextField(
            labelText: LocaleKeys.Authentication_user_name.tr(),
            hintText: LocaleKeys.Authentication_user_name.tr(),
            controller: loginCubit.usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.Authentication_enterEmail.tr();
              }
              return null;
            },
          ),
          verticalSpace(40),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              bool isPasswordVisible = false;
              if (state is LoginpassToggle) {
                isPasswordVisible = state.isPassvisable;
              }

              return CustomFormTextField(
                isObscureText: !isPasswordVisible,
                labelText: LocaleKeys.Authentication_password.tr(),
                hintText: LocaleKeys.Authentication_password.tr(),
                controller: loginCubit.passwordController,
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<LoginCubit>().togglepass();
                  },
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.Authentication_enterPassword.tr();
                  }
                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}