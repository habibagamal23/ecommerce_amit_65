import 'package:ecommerce65/core/utils/extention.dart';
import 'package:ecommerce65/core/utils/spacing.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routs/routs.dart';
import '../../../../core/utils/colors.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Dont have ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextSpan(
              text: ' create ',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: ColorsManager.mainRed, fontSize: 13.sp),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
