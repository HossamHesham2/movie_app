import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/utils/color_managers.dart';

class CustomIconBottomBar extends StatelessWidget {
  final String svg;
  final bool isSelected;

  const CustomIconBottomBar({
    super.key,
    required this.svg,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg,
      colorFilter: isSelected
          ? ColorFilter.mode(
              ColorsManager.yellowFB,
              BlendMode.srcIn,
              // blend mode
            )
          : ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
              // blend mode
            ),
      width: 24,
      height: 24,
    );
  }
}
