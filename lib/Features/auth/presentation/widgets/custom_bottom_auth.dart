import 'package:flutter/material.dart';
import 'package:movie_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/font_weight_manager.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

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
          style: StyleInterManager.regular14.copyWith(color: ColorsManager.white),
        ),
        CustomTextButton(
          text: text,
          fontWeight: FontWeightManager.bold,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
