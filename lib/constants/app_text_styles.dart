import 'package:flutter/material.dart';
import 'package:ivent_trial/constants/app_colors.dart';

/// Centralized text styles following a systematic approach
///
/// Naming convention: {weight}{size}{color}
/// Example: boldLarge01AEBE = bold + large + blue color
class AppTextStyles {
  AppTextStyles._();

  // Base text styles
  static const TextStyle _baseStyle = TextStyle(
    fontFamily: 'SF Pro Display',
    height: 1.2,
    letterSpacing: 0,
    overflow: TextOverflow.ellipsis,
  );

  // Font weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;

  // Font sizes
  static const double size10 = 10; // tiny
  static const double size12 = 12; // small
  static const double size14 = 14; // body
  static const double size16 = 16; // subtitle
  static const double size18 = 18; // title
  static const double size20 = 20; // h4
  static const double size24 = 24; // h3
  static const double size28 = 28; // h2
  static const double size32 = 32; // h1

  static TextStyle get bold24Primary =>
      _baseStyle.copyWith(fontSize: size24, fontWeight: bold, color: AppColors.primary);

  static TextStyle get bold32TextSecondary =>
      _baseStyle.copyWith(fontSize: size32, fontWeight: bold, color: AppColors.textSecondary);

  static TextStyle get bold32 =>
      _baseStyle.copyWith(fontSize: size32, fontWeight: bold, color: AppColors.textPrimary);

  static TextStyle get medium16 =>
      _baseStyle.copyWith(fontSize: size16, fontWeight: medium, color: AppColors.textPrimary);

  static TextStyle get medium16White =>
      _baseStyle.copyWith(fontSize: size16, fontWeight: medium, color: AppColors.white);

  static TextStyle get medium14TextSecondary =>
      _baseStyle.copyWith(fontSize: size14, fontWeight: medium, color: AppColors.textSecondary);

  static TextStyle get medium14Primary =>
      _baseStyle.copyWith(fontSize: size14, fontWeight: medium, color: AppColors.primary);

  static TextStyle get bold24 => _baseStyle.copyWith(fontSize: size24, fontWeight: bold, color: AppColors.textPrimary);
}
