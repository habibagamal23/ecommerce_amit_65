import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          CircleAvatar(
            radius: 20.0.r,
            backgroundImage: const AssetImage(Assets.imagesLogo),
          ),
        ],
      ),
    );
  }
}
