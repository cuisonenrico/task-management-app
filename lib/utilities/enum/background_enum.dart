import 'dart:ui';

import 'package:flutter/material.dart';

enum BackgroundColor {
  ONE(Colors.green),
  TWO(Colors.blue),
  THREE(Colors.purple);

  final Color color;

  const BackgroundColor(this.color);
}
