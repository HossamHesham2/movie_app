import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/assets/assets_manager.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class CustomLanguageToggle extends StatelessWidget {
  const CustomLanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: StyleManager.yellowF6),
        borderRadius: BorderRadius.circular(200.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: StyleManager.yellowF6,
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: StyleManager.yellowF6),
              ),
              child: SvgPicture.asset(SvgsManager.usFlag),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                color: StyleManager.transparent,
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: StyleManager.transparent),
              ),
              child: SvgPicture.asset(SvgsManager.egFlag),
            ),
          ),
        ],
      ),
    );
  }
}
