import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../Model/CategoryModel.dart';

class HomeCategory extends StatelessWidget {
  final CategoryModel categoryModel;

  const HomeCategory({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      height: 90.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundImage: AssetImage(categoryModel.imageCategory),
            onBackgroundImageError: (_, __) => const Icon(Icons.error),
          ),
          verticalSpace(5),
          Text(
            categoryModel.nameCategory.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
