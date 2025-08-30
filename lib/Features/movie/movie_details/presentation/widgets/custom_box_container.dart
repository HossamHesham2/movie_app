import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomBoxContainer extends StatelessWidget {
  final IconData? icon;
  final int? numberInt;
  final double? numberDouble;
  final Color iconColor;
  final Color textColor;
  final double iconSize;
  final double borderRadius;

  const CustomBoxContainer({
    super.key,
    this.icon,
    this.numberInt,
    this.numberDouble,
    this.iconColor = ColorsManager.yellowFB,
    this.textColor = ColorsManager.white,
    this.iconSize = 30,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    final String? displayNumber = numberInt != null
        ? numberInt.toString()
        : numberDouble?.toString();

    return Container(

      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorsManager.black28,
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: iconColor, size: iconSize.sp),
          if (icon != null && displayNumber != null)
            SizedBox(width: 10.w),
          if (displayNumber != null)
            Text(
              displayNumber,
              style: StyleInterManager.bold24.copyWith(color: textColor),
            ),
        ],
      ),
    );
  }
}
