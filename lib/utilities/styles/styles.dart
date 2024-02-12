import 'package:flutter/material.dart';

/// Font Sizes
/// You can use these directly if you need, but usually there should be a predefined style in [TextStyles].
class FontSizes {
  FontSizes._();

  static double get s10 => 10;

  static double get s12 => 12;

  static double get s14 => 14;

  static double get s16 => 16;

  static double get s20 => 20;

  static double get s24 => 24;

  static double get s32 => 32;

  static double get compactTextScaleFactor => 0.5;

  static double get mediumTextScaleFactor => 0.7;

  static double get expandedTextScaleFactor => 1.0;
}

/// TextStyles - All the core text styles for the app should be declared here.
/// Don't try and create every variant in existence here, just the high level ones.
/// More specific variants can be created on the fly using `style.copyWith()`
/// `newStyle = TextStyles.bodySmall.copyWith(lineHeight: 2, color: Colors.red, decoration: TextDecoration.underline)`
class TextStyles {
  TextStyles._();

  static const String sourceSansPro = "Source Sans Pro";

  /// Declare a base style Family
  static const TextStyle sourceSansProStyles = TextStyle(
    fontFamily: sourceSansPro,
    color: Color(0xFF6C6C6C),
  );

  static TextStyle headlineStyles = sourceSansProStyles.copyWith(fontWeight: FontWeight.w600);

  static TextStyle bodyStyles = sourceSansProStyles.copyWith(fontWeight: FontWeight.w400);

  static TextStyle buttonText = headlineStyles.copyWith(fontSize: FontSizes.s14);

  static TextStyle get headline1 => headlineStyles.copyWith(fontSize: FontSizes.s32);

  static TextStyle get headline2 => headlineStyles.copyWith(fontSize: FontSizes.s24);

  static TextStyle get headline3 => headlineStyles.copyWith(fontSize: FontSizes.s20);

  static TextStyle get headline4 => headlineStyles.copyWith(fontSize: FontSizes.s16);

  static TextStyle get body1 => bodyStyles.copyWith(fontSize: FontSizes.s16);

  static TextStyle get body2 => bodyStyles.copyWith(fontSize: FontSizes.s14);

  static TextStyle get body3 => bodyStyles.copyWith(fontSize: FontSizes.s12);

  static TextStyle get label1 => headlineStyles.copyWith(
        fontSize: FontSizes.s16,
        color: const Color(0xFF141414),
      );

  static TextStyle get label2 => headlineStyles.copyWith(
        fontSize: FontSizes.s14,
        color: const Color(0xFF6C6C6C),
      );

  static TextStyle get label3 => headlineStyles.copyWith(
        fontSize: FontSizes.s12,
        color: const Color(0xFF6C6C6C),
      );

  static TextStyle get label4 => headlineStyles.copyWith(fontSize: FontSizes.s10);

  static TextStyle get primaryButtonText => buttonText.copyWith(color: Colors.white);

  static TextStyle get secondaryButtonText => buttonText.copyWith(color: const Color(0xFF333333));
}
