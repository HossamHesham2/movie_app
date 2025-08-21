import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/extensions/build_context_extension.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;

  final String text;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
    this.prefixWidget,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(color: borderColor),
          ),
          backgroundColor: backgroundColor,
          padding: EdgeInsets.all(15),
        ),
        onPressed: onPressed,
        child: Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (context.isEnglish) ?prefixWidget,
            if (context.isArabic) ?suffixWidget,

            Text(
              text,
              style: StyleManager.regular20.copyWith(color: textColor),
            ),
            if (context.isArabic) ?prefixWidget,
            if (context.isEnglish) ?suffixWidget,
          ],
        ),
      ),
    );
  }
}
