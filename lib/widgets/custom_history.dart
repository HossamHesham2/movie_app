import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/styles/style_manager.dart';

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
          style: StyleManager.bold24.copyWith(color: StyleManager.white),
        ),
        SizedBox(height: 10.h),
        Text(
          text,
          style: StyleManager.bold20.copyWith(color: StyleManager.white),
        ),
      ],
    );
  }
}
