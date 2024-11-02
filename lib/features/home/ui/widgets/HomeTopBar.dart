import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../LogicApp/langugue_cubit.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/assets.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          Row(
            children: [
              Image.asset(
                Assets.imagesLogo,
                height: 40.0.h,
              ),
              horizontalSpace(30),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final newLanguageCode =
              context.locale.languageCode == 'en' ? 'ar' : 'en';
              context
                  .read<LangugueCubit>()
                  .changeLanguage(newLanguageCode);
              context.setLocale(Locale(newLanguageCode));
            },
          )
        ],
      ),
    );
  }
}
