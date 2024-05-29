import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/gen/assets.gen.dart';
import 'package:task_management_app/screens/widgets/app_expansion_tile.dart';
import 'package:task_management_app/screens/widgets/input_field.dart';
import 'package:task_management_app/utilities/extensions/svg_ext.dart';
import 'package:task_management_app/utilities/styles/styles.dart';
import 'package:task_management_app/utilities/widget_constants.dart';

const double _datePickerHeight = 150.0;

class CreateEventDialog extends StatelessWidget {
  const CreateEventDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Add new event'),
      children: <Widget>[
        Column(
          children: [
            InputField(
              onChangeText: (_) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultHalfPadding),
              child: AppExpansionTile(
                padding: EdgeInsets.zero,
                onExpansionChanged: (_) {},
                displayedText: 'From',
                displayedTextTextStyle: TextStyles.body1,
                icon: Assets.svgImages.chevronDown.svg,
                children: [
                  SizedBox(
                    height: _datePickerHeight,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: defaultQuarterPadding),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: DateTime.now(),
                        // This is called when the user changes the dateTime.
                        onDateTimeChanged: (time) => {}, //onChangeTime(TimeRange.START_TIME, time)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultHalfPadding),
              child: AppExpansionTile(
                padding: EdgeInsets.zero,
                onExpansionChanged: (_) {},
                displayedText: 'To',
                displayedTextTextStyle: TextStyles.body1,
                icon: Assets.svgImages.chevronDown.svg,
                children: [
                  SizedBox(
                    height: _datePickerHeight,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: defaultQuarterPadding),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: DateTime.now(),
                        // This is called when the user changes the dateTime.
                        onDateTimeChanged: (time) => {}, //onChangeTime(TimeRange.START_TIME, time)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(defaultQuarterPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog
                },
              ),
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
