import 'package:flutter/material.dart';
import 'package:task_management_app/utilities/widget_constants.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    this.onPressed,
    this.border,
    this.gradient,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback? onPressed;
  final Border? border;
  final Gradient? gradient;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: defaultBorderRadius,
      onTap: onPressed,
      child: Container(
        height: 48.0,
        width: 48.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          gradient: gradient,
          borderRadius: defaultBorderRadius,
        ),
        child: icon,
      ),
    );
  }
}
