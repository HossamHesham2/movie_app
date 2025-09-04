import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomProfileImage extends StatelessWidget {
  final String name;
  final String imageProfile;

  const CustomProfileImage({
    super.key,
    required this.name,
    required this.imageProfile,
  });

  bool _isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: ColorsManager.greyAD,
          child: ClipOval(
            child: _isNetworkImage(imageProfile)
                ? Image.network(
              imageProfile,
              fit: BoxFit.cover,
              width: 100.r,
              height: 100.r,
            )
                : Image.asset(
              imageProfile,
              fit: BoxFit.cover,
              width: 100.r,
              height: 100.r,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          name,
          style: StyleInterManager.bold20.copyWith(color: ColorsManager.white),
        ),
      ],
    );
  }
}
