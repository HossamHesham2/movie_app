import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/color_managers.dart';
import 'package:movie_app/core/utils/style_inter_manager.dart';

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

      style: StyleInterManager.regular16.copyWith(color: ColorsManager.white),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: ColorsManager.white,
        suffixIcon: suffixIcon,
        suffixIconColor: ColorsManager.white,
        hint: Text(
          hint,
          style: StyleInterManager.regular15.copyWith(
            color: ColorsManager.white,
          ),
        ),

        fillColor: ColorsManager.black28,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorsManager.black28),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorsManager.black28),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorsManager.black28),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorsManager.redF8),
        ),
        errorStyle: StyleInterManager.regular14.copyWith(
          color: ColorsManager.redF8,
        ),
      ),
    );
  }
}
