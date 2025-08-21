import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleManager {
  // Colors
  static Color black12 = Color(0xFF121312);
  static Color black28 = Color(0xFF282A28);
  static Color white = Color(0xFFFFFFFF);
  static Color green57 = Color(0xFF57AA53);
  static Color yellowF6 = Color(0xFFF6BD00);
  static Color yellowFB = Color(0xFFFFBB3B);
  static Color redF8 = Color(0xFFE82626);
  static Color transparent = Colors.transparent;

  // Fonts weight
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;

  // Font Size
  static double size36 = 36.0.sp;
  static double size24 = 24.0.sp;
  static double size20 = 20.0.sp;
  static double size16 = 16.0.sp;
  static double size15 = 15.0.sp;
  static double size14 = 14.0.sp;

  // Google Font Styles

  static TextStyle bold36 = GoogleFonts.inter(
    fontSize: size36,
    fontWeight: bold,
  );
  static TextStyle bold24 = GoogleFonts.inter(
    fontSize: size24,
    fontWeight: bold,
  );
  static TextStyle bold20 = GoogleFonts.inter(
    fontSize: size20,
    fontWeight: bold,
  );
  static TextStyle regular20 = GoogleFonts.inter(
    fontSize: size20,
    fontWeight: regular,
  );
  static TextStyle regular16 = GoogleFonts.inter(
    fontSize: size16,
    fontWeight: regular,
  );
  static TextStyle regular15 = GoogleFonts.inter(
    fontSize: size15,
    fontWeight: regular,
  );
  static TextStyle regular14 = GoogleFonts.inter(
    fontSize: size14,
    fontWeight: regular,
  );
}
