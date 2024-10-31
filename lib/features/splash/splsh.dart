import 'package:ecommerce65/core/routs/routs.dart';
import 'package:ecommerce65/core/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {

      context.pushReplacementNamed(Routes.loginScreen);


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(100),
          child: Image.asset(
            Assets.imagesLogo,
            height: 100.h,
            width: 200.w,
          ),
        ),
      ),
    );
  }
}
