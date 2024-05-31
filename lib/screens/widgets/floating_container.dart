import 'package:flutter/material.dart';
import 'package:task_management_app/utilities/constants/constants.dart';
import 'package:task_management_app/utilities/styles/spacers.dart';
import 'package:task_management_app/utilities/styles/styles.dart';
import 'package:task_management_app/utilities/widget_constants.dart';

class FloatingContainer extends StatelessWidget {
  const FloatingContainer({
    this.margin = const EdgeInsets.symmetric(horizontal: defaultQuarterPadding),
    this.padding,
    this.child,
    this.height,
    this.width,
    this.decoration,
    this.cardTitle,
    this.onPressedSecondary,
    super.key,
  });

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final double? height;
  final double? width;
  final Widget? child;

  // Container Title elements
  final String? cardTitle;
  final VoidCallback? onPressedSecondary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (cardTitle != null || onPressedSecondary != null)
          Container(
            margin: margin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: cardTitle != null,
                  child: Text(
                    cardTitle ?? emptyString,
                    style: TextStyles.headline4.copyWith(fontWeight: FontWeight.w800),
                  ),
                ),
                Visibility(
                  visible: onPressedSecondary != null,
                  child: InkWell(
                    onTap: onPressedSecondary,
                    child: Text(
                      'editLabel',
                      style: TextStyles.headline4.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        const VerticalSpace(defaultQuarterSpacing),
        Container(
          padding: padding,
          margin: margin,
          height: height,
          width: width,
          decoration: decoration ?? defaultBoxDecorationWithShadow,
          clipBehavior: Clip.antiAlias,
          child: child,
        ),
      ],
    );
  }
}
