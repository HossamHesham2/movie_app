import 'package:flutter/material.dart';
import 'package:movie_app/Views/widgets/custom_text_button.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class CustomBottomAuth extends StatelessWidget {
  final String title;

  final String text;
  final void Function()? onPressed;

  const CustomBottomAuth({
    super.key,
    required this.title,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: StyleManager.regular14.copyWith(color: StyleManager.white),
        ),
        CustomTextButton(
          text: text,
          fontWeight: StyleManager.bold,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
