import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  final TextEditingController? controller;
  final String hint;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.controller,
    this.validator,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    required this.obscureText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      obscureText: obscureText,

      style: StyleManager.regular16.copyWith(color: StyleManager.white),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: StyleManager.white,
        suffixIcon: suffixIcon,
        suffixIconColor: StyleManager.white,
        hint: Text(
          hint,
          style: StyleManager.regular15.copyWith(color: StyleManager.white),
        ),

        fillColor: StyleManager.black28,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: StyleManager.black28),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: StyleManager.black28),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: StyleManager.black28),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: StyleManager.redF8),
        ),
        errorStyle: StyleManager.regular14.copyWith(color: StyleManager.redF8),
      ),
    );
  }
}
