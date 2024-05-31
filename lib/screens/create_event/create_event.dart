import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_app/gen/assets.gen.dart';
import 'package:task_management_app/screens/widgets/app_bar.dart';
import 'package:task_management_app/screens/widgets/app_expansion_tile.dart';
import 'package:task_management_app/screens/widgets/app_scaffold.dart';
import 'package:task_management_app/screens/widgets/floating_container.dart';
import 'package:task_management_app/screens/widgets/input_field.dart';
import 'package:task_management_app/screens/widgets/primary_button.dart';
import 'package:task_management_app/state/meeting_state/model/event.dart';
import 'package:task_management_app/utilities/app_router.dart';
import 'package:task_management_app/utilities/extensions/svg_ext.dart';
import 'package:task_management_app/utilities/styles/spacers.dart';
import 'package:task_management_app/utilities/styles/styles.dart';
import 'package:task_management_app/utilities/widget_constants.dart';

const double _datePickerHeight = 150.0;

class CreateEvent extends StatelessWidget {
  const CreateEvent({
    required this.onChangedEvent,
    required this.newEvent,
    super.key,
  });

  final EventModel? newEvent;
  final ValueChanged<EventModel> onChangedEvent;

  @override
  Widget build(BuildContext context) {
    final event = newEvent ?? const EventModel();
    return AppScaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => router.pop(),
        child: const Icon(Icons.arrow_back_ios_outlined),
      ),
      appBar: MyAppBar(
        isSecondaryIconVisible: false,
        isBackButtonVisible: false,
        isMessagingIconVisible: false,
        isCornersRounded: false,
        color: Colors.transparent,
        label: 'Create your Event!',
        labelTextStyle: GoogleFonts.dancingScript(fontSize: 40, color: Colors.black),
      ),
      extendBody: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: defaultPadding),
          child: Column(
            children: [
              Column(
                children: [
                  InputField(
                    hintText: "What's the name of the event?",
                    onChangeText: (eventName) => onChangedEvent(event.copyWith(eventName: eventName)),
                  ),
                  FloatingContainer(
                    margin: const EdgeInsets.symmetric(horizontal: defaultHalfPadding),
                    child: SizedBox(
                      height: _datePickerHeight,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: defaultQuarterPadding),
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: DateTime.now(),
                          // This is called when the user changes the dateTime.
                          onDateTimeChanged: (date) {},
                        ),
                      ),
                    ),
                  ),
                  const FloatingContainer(
                    margin: EdgeInsets.symmetric(horizontal: defaultHalfPadding),
                    child: Row(
                      children: [
                        // TODO: implement radio button for [isAllDay]
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultHalfPadding),
                    child: AppExpansionTile(
                      padding: EdgeInsets.zero,
                      onExpansionChanged: (_) {},
                      displayedText: event.from == null ? 'From' : event.from.toString(),
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
                              onDateTimeChanged: (fromTime) => onChangedEvent(event.copyWith(from: fromTime)),
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
                      displayedText: event.to == null ? 'To' : event.to.toString(),
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
                              onDateTimeChanged: (toTime) => onChangedEvent(event.copyWith(to: toTime)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              InputField(
                hintText: 'What will you be doing at this time?',
                maxLines: 5,
                onChangeText: (_) {},
              ),
              const VerticalSpace(16.0),
              Padding(
                padding: const EdgeInsets.all(defaultQuarterPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(defaultQuarterPadding),
                        child: PrimaryButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Dismiss dialog
                          },
                          label: 'Save',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
