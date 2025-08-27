import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class CustomTabBarText extends StatelessWidget {
  final IconData icon;

  final String text;

  const CustomTabBarText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Icon(icon, size: StyleManager.size36, color: StyleManager.yellowFB),
        SizedBox(height: 10.h),
        Text(
          text,
          style: StyleManager.regular20.copyWith(color: StyleManager.white),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
