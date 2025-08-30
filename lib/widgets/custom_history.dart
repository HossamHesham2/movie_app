import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomHistory extends StatelessWidget {
  final String number;
  final String text;

  const CustomHistory({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: StyleInterManager.bold24.copyWith(color: ColorsManager.white),
        ),
        SizedBox(height: 10.h),
        Text(
          text,
          style: StyleInterManager.bold20.copyWith(color: ColorsManager.white),
        ),
      ],
    );
  }
}
