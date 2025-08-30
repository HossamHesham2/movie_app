import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/font_size_manager.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomTabBarText extends StatelessWidget {
  final IconData icon;

  final String text;

  const CustomTabBarText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Icon(icon, size: FontSizeManager.size36, color: ColorsManager.yellowFB),
        SizedBox(height: 10.h),
        Text(
          text,
          style: StyleInterManager.regular20.copyWith(color: ColorsManager.white),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
