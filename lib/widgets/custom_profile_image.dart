import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class CustomProfileImage extends StatelessWidget {
  final String name;
  final String imageProfile;

  const CustomProfileImage({
    super.key,
    required this.name,
    required this.imageProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(child: Image.asset(imageProfile), radius: 50.r),
        SizedBox(height: 20.h),
        Text(
          name,
          style: StyleManager.bold20.copyWith(color: StyleManager.white),
        ),
      ],
    );
  }
}
