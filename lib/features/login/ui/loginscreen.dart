import 'package:ecommerce65/core/utils/colors.dart';
import 'package:ecommerce65/features/login/ui/widgets/DontHaveAccountText.dart';
import 'package:ecommerce65/features/login/ui/widgets/EmailAndPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/widgets/cusombutton.dart';

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
                       },
                  ),
                ),
                verticalSpace(30),
                Text(
                  'WLCOME Back',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 36.sp, fontWeight: FontWeight.bold),
                ),
                verticalSpace(50),
                EmailAndPassword(),
                verticalSpace(50),

                     CustomButton(
                      text: 'Login',
                      onPressed: () {}
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
