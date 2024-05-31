import 'package:flutter/material.dart';
import 'package:task_management_app/utilities/default_colors.dart';
import 'package:task_management_app/utilities/styles/spacers.dart';
import 'package:task_management_app/utilities/styles/styles.dart';
import 'package:task_management_app/utilities/widget_constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.label,
    this.color,
    this.labelColor,
    this.gradient,
    this.height,
    this.width,
    this.labelSize,
    this.suffix,
    this.leading,
    this.borderRadius,
    this.border,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color? color;
  final Color? labelColor;
  final Gradient? gradient;
  final double? height;
  final double? width;
  final double? labelSize;
  final Widget? suffix;
  final Widget? leading;
  final BorderRadius? borderRadius;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? buttonHeight,
      width: width,
      decoration: BoxDecoration(
        color: color ?? primaryColor,
        gradient: gradient,
        borderRadius: borderRadius ?? BorderRadius.circular(defaultQuarterRadius),
        border: border,
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
          FocusScope.of(context).unfocus();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(defaultQuarterRadius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              leading!,
              const HorizontalSpace(defaultQuarterSpacing),
            ],
            Text(
              label,
              style: TextStyles.primaryButtonText.copyWith(color: labelColor),
            ),
            if (suffix != null) ...[
              const HorizontalSpace(defaultHalfSpacing),
              suffix!,
            ]
          ],
        ),
      ),
    );
  }
}
