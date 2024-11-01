import 'package:ecommerce65/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerViewAll extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onButtonPressed;

  const ContainerViewAll({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.backgroundColor,
    required this.icon,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16.0.w),

      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.0.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              SizedBox(height: 4.0.h),
              Row(
                children: [
                  Icon(
                    icon,
                    size: 14.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4.0.w),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 12.sp,
                        ),
                  ),
                ],
              ),
            ],
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0.r),
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
            ),
            onPressed: onButtonPressed,
            child: Row(
              children: [
                Text(
                  buttonText,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                horizontalSpace(40),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
