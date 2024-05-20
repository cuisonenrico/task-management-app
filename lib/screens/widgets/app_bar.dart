import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/screens/widgets/app_bar_label.dart';
import 'package:task_management_app/screens/widgets/app_icon_button.dart';
import 'package:task_management_app/utilities/default_colors.dart';
import 'package:task_management_app/utilities/extensions/theme_extensions.dart';
import 'package:task_management_app/utilities/widget_constants.dart';

const double _backButtonSize = 50.0;

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    this.label,
    this.onSecondaryActionPressed,
    this.onPressBack,
    this.secondaryActionIcon = Icons.menu,
    this.isSecondaryIconVisible = true,
    this.isMessagingIconVisible = true,
    this.isBackButtonVisible = true,
    this.labelTextStyle,
    this.subLabel,
    this.isCornersRounded = true,
    this.isShadowVisible = true,
    this.backIconSubstitute,
    this.color,
    this.secondaryButtonColor,
    this.child,
    super.key,
  });

  final VoidCallback? onSecondaryActionPressed;
  final VoidCallback? onPressBack;

  final bool isCornersRounded;
  final bool isSecondaryIconVisible;
  final bool isMessagingIconVisible;
  final bool isBackButtonVisible;
  final String? label;
  final IconData secondaryActionIcon;
  final bool isShadowVisible;
  final TextStyle? labelTextStyle;
  final String? subLabel;
  final IconData? backIconSubstitute;
  final Color? color;
  final Color? secondaryButtonColor;
  final Widget? child;

  double get _verticalPadding => subLabel != null ? defaultHalfPadding : defaultQuarterPadding;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      // Padding for the device's status bar
      padding: EdgeInsets.only(
        top: viewPadding.top,
        bottom: viewPadding.bottom,
      ),
      decoration: BoxDecoration(
        color: color ?? primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(isCornersRounded ? defaultHalfRadius : 0.0)),
        boxShadow: null,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: _verticalPadding,
          bottom: _verticalPadding,
          left: defaultHalfPadding,
        ),
        child: Column(
          children: [
            Row(
              children: [
                if (isBackButtonVisible)
                  AppIconButton(
                    icon: Icon(
                      backIconSubstitute ?? Icons.chevron_left_rounded,
                      size: _backButtonSize,
                      color: color.getElementColor,
                    ),
                    onPressed: onPressBack ?? context.pop,
                  ),
                Expanded(
                  child: AppBarLabel(
                    label: label ?? '',
                    subLabel: subLabel,
                    labelTextStyle: labelTextStyle?.copyWith(color: color.getElementColor),
                  ),
                ),
                if (isMessagingIconVisible)
                  AppIconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message,
                      color: color.getElementColor,
                    ),
                  ),
                if (isSecondaryIconVisible)
                  AppIconButton(
                    onPressed: onSecondaryActionPressed,
                    icon: Icon(
                      secondaryActionIcon,
                      color: secondaryButtonColor ?? color.getElementColor,
                    ),
                  ),
              ],
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
