import 'package:flutter/material.dart';
import 'package:movie_app/core/styles/style_manager.dart';

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
        style: StyleManager.regular14.copyWith(
          color: StyleManager.yellowF6,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
