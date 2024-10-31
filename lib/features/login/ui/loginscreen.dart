import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce65/core/routs/routs.dart';
import 'package:ecommerce65/core/utils/colors.dart';
import 'package:ecommerce65/core/utils/extention.dart';
import 'package:ecommerce65/features/login/ui/widgets/DontHaveAccountText.dart';
import 'package:ecommerce65/features/login/ui/widgets/EmailAndPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../LogicApp/langugue_cubit.dart';

import '../../../core/utils/spacing.dart';
import '../../../core/widgets/cusombutton.dart';
import '../../../generated/locale_keys.g.dart';
import '../logic/login_cubit.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.language),
                    onPressed: () {
                      final newLanguageCode =
                          context.locale.languageCode == 'en' ? 'ar' : 'en';
                      context
                          .read<LangugueCubit>()
                          .changeLanguage(newLanguageCode);
                      context.setLocale(Locale(newLanguageCode));
                    },
                  ),
                ),
             verticalSpace(10),
                Text(
                  LocaleKeys.Authentication_title_Login.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 36.sp, fontWeight: FontWeight.bold),
                ),
                verticalSpace(50),
                EmailAndPassword(),
                verticalSpace(50),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Successful!") , backgroundColor: ColorsManager.mainGreen,),
                      );
                      context.pushReplacementNamed(Routes.homeScreen);

                    } else if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error) , backgroundColor: ColorsManager.mainRed,),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return CustomButton(
                      text: LocaleKeys.Authentication_Login_bottom.tr(),
                      onPressed: () => context.read<LoginCubit>().login(),

                    );
                  },
                ),
                verticalSpace(30),
                DontHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
