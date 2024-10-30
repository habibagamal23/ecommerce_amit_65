import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/textfieldcutom.dart';
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
            labelText: 'Username',
            hintText: 'Username',
            controller: loginCubit.usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username';
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
                labelText: 'pass',
                hintText: 'pass',
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
                    return 'pass';
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
