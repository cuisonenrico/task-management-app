import 'package:flutter/material.dart';

extension ThemeExt on Color? {
  Color? get getElementColor {
    if (this == null) return Colors.black;
    // Calculate the luminance of the background color
    double luminance = this!.computeLuminance();

    // Choose text color based on luminance
    return luminance > 0.25 ? Colors.black : Colors.white;
  }
}
