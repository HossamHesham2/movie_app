import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;

  final String text;
  final FontWeight? fontWeight;

  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: StyleInterManager.regular14.copyWith(
          color: ColorsManager.yellowF6,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
