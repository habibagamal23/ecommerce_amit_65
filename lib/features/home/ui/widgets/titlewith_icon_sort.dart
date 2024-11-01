import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithActions extends StatelessWidget {
  final String title;
  final VoidCallback onSortPressed;
  final VoidCallback onFilterPressed;

  const TitleWithActions({
    super.key,
    required this.title,
    required this.onSortPressed,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              // Sort Button
              ElevatedButton.icon(
                onPressed: onSortPressed,
                icon: Icon(Icons.sort, size: 16.sp, color: Colors.black),
                label: Text(
                  'Sort',
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              // Filter Button
              ElevatedButton.icon(
                onPressed: onFilterPressed,
                icon: Icon(Icons.filter_list, size: 16.sp, color: Colors.black),
                label: Text(
                  'Filter',
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
