import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce65/core/utils/colors.dart';
import 'package:ecommerce65/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';

class PromotionalCarousel extends StatelessWidget {
  final List<String> catogry;
  const PromotionalCarousel({super.key, required this.catogry});

  @override
  Widget build(BuildContext context) {
    List<String> ImagesCategory = [
      Assets.imagesElectronics,
      Assets.imagesJelwry,
      Assets.imagesMens,
      Assets.imagesWomen,
    ];
    return CarouselSlider.builder(
      itemCount: catogry.length,
      options: CarouselOptions(
        height: 180.h,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 16 / 7,
        initialPage: 0,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(15.0.r),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 20.w,
                top: 20.h,
                left: 170.w,
                bottom: 20.h,
                child: Image.asset(
                  ImagesCategory[index],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      catogry[index].toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    verticalSpace(30),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Shop Now',
                            style: TextStyle(color: Colors.white),
                          ),
                          horizontalSpace(4),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
