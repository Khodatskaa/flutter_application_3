import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/theme/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static TextStyle get splashText => GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.splashTextColor,
      );
  static TextStyle get primaryText => GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryTextColor,
      );
  static TextStyle get secondaryText => GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryTextColor,
      );
  static TextStyle get buttonTextActive => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
  static TextStyle get buttonTextDisable => buttonTextActive.copyWith(
        color: AppColors.disableButtonColor,
      );
}
