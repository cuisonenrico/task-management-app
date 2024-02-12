// Spacing
import 'package:flutter/material.dart';
import 'package:task_management_app/utilities/default_colors.dart';

const defaultSpacing = 32.0;
const defaultDoubledSpacing = 64.0;
const defaultThirdSpacing = 24.0;
const defaultHalfSpacing = 16.0;
const defaultQuarterSpacing = 8.0;

// Radius
const defaultRadius = 32.0;
const defaultThirdRadius = 24.0;
const defaultHalfRadius = 16.0;
const defaultQuarterRadius = 8.0;

// Padding
const detailsTextFieldPadding = EdgeInsets.symmetric(vertical: 4.0);
const defaultPadding = 32.0;
const defaultThirdPadding = 24.0;
const defaultHalfPadding = 16.0;
const defaultQuarterPadding = 8.0;

// Button
const buttonHeight = 42.0;
const zoomButtonHeight = 74.0;
const zoomButtonWidth = 36.0;
const zoomButtonBorderRadius = 12.0;
const zoomButtonHorizontalPadding = 11.0;
const mapButtonSize = 36.0;
const mapButtonBorderRadius = 12.0;

final defaultBoxDecorationWithShadow = BoxDecoration(
  color: Colors.white,
  borderRadius: defaultBorderRadius,
  boxShadow: [defaultShadow],
);

final defaultFieldDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(defaultQuarterRadius),
  boxShadow: [defaultShadow],
);

// Icon Size
const defaultIconSize = 30.0;

//
const defaultIntOne = 1;

final defaultShadow = BoxShadow(
  color: cardShadowColor,
  blurRadius: 10,
  offset: const Offset(0, 4),
);

final defaultBorderRadius = BorderRadius.circular(defaultHalfRadius);
