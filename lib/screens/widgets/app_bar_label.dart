import 'package:flutter/material.dart';
import 'package:task_management_app/utilities/styles/spacers.dart';
import 'package:task_management_app/utilities/styles/styles.dart';

class AppBarLabel extends StatelessWidget {
  const AppBarLabel({
    required this.label,
    this.labelTextStyle,
    this.subLabel,
    super.key,
  });

  final String label;
  final TextStyle? labelTextStyle;
  final String? subLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelTextStyle ?? TextStyles.headline2,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (subLabel != null) ...[
          const VerticalSpace(4.0),
          Text(
            subLabel ?? '',
            style: TextStyles.body2,
          ),
        ],
      ],
    );
  }
}
