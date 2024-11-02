import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../generated/assets.dart';

class HomeCategory extends StatelessWidget {
  final String category;
  final String image;
  final bool isSelected; // New parameter to indicate selection

  const HomeCategory({
    super.key,
    required this.category,
    required this.image,
    required this.isSelected, // Mark selected category
  });

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
            backgroundColor: isSelected ? Colors.blue : Colors.grey.shade200, // Blue if selected
            child: CircleAvatar(
              radius: 32.r, // Inner image circle
              backgroundImage: AssetImage(image),
              onBackgroundImageError: (_, __) => const Icon(Icons.error),
            ),
          ),
          verticalSpace(5),
          Text(
            category.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 11.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.blue : Colors.black, // Blue text if selected
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
