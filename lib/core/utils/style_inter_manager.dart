import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/font_size_manager.dart';
import 'package:movie_app/core/utils/font_weight_manager.dart';

class StyleInterManager {
  static TextStyle bold36 = GoogleFonts.inter(
    fontSize: FontSizeManager.size36,
    fontWeight: FontWeightManager.bold,
  );
  static TextStyle bold24 = GoogleFonts.inter(
    fontSize: FontSizeManager.size24,
    fontWeight: FontWeightManager.bold,
  );
  static TextStyle bold20 = GoogleFonts.inter(
    fontSize: FontSizeManager.size20,
    fontWeight: FontWeightManager.bold
  );
  static TextStyle regular20 = GoogleFonts.inter(
    fontSize: FontSizeManager.size20,
    fontWeight: FontWeightManager.regular,
  );
  static TextStyle regular16 = GoogleFonts.inter(
    fontSize: FontSizeManager.size16,
    fontWeight: FontWeightManager.regular,
  );
  static TextStyle regular15 = GoogleFonts.inter(
    fontSize: FontSizeManager.size15,
    fontWeight: FontWeightManager.regular,
  );
  static TextStyle regular14 = GoogleFonts.inter(
    fontSize: FontSizeManager.size14,
    fontWeight: FontWeightManager.regular,
  );
}