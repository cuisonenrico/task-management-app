import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_management_app/screens/main_page/widgets/create_event_dialog.dart';
import 'package:task_management_app/screens/widgets/app_bar.dart';
import 'package:task_management_app/screens/widgets/app_scaffold.dart';
import 'package:task_management_app/state/meeting_state/classes/meeting_data_source.dart';
import 'package:task_management_app/state/meeting_state/model/meeting.dart';
import 'package:task_management_app/state/user_state/user_model/user_model.dart';
import 'package:task_management_app/utilities/widget_constants.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    required this.counter,
    required this.user,
    required this.meetings,
    super.key,
  });

  final int counter;

  final UserModel user;

  final List<MeetingModel> meetings;

  @override
  Widget build(BuildContext context) {
    final CalendarController calendarController = CalendarController();
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => calendarController.view = CalendarView.month,
      child: AppScaffold(
        appBar: const MyAppBar(
          isSecondaryIconVisible: true,
          secondaryButtonColor: Colors.deepPurpleAccent,
          isBackButtonVisible: false,
          isMessagingIconVisible: false,
          isCornersRounded: false,
          color: Colors.transparent,
        ),
        body: SfCalendar(
          controller: calendarController,
          selectionDecoration: BoxDecoration(color: Colors.purple.withOpacity(0.2)),
          view: CalendarView.month,
          allowedViews: const [
            CalendarView.day,
            CalendarView.month,
            CalendarView.schedule,
          ],
          showDatePickerButton: true,
          showNavigationArrow: true,
          showTodayButton: true,
          dataSource: MeetingDataSource(meetings),
          monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),
          // TODO: onTap redirect to view events in specific day
          onLongPress: (selectedDay) {
            calendarController.view = CalendarView.day;
            calendarController.displayDate = selectedDay.date ?? DateTime.now();
          },
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          spaceBetweenChildren: 4,
          childPadding: const EdgeInsets.all(defaultQuarterPadding),
          animationCurve: Curves.elasticInOut,
          shape: const StadiumBorder(),
          direction: SpeedDialDirection.left,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add),
              onTap: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext dialogContext) {
                    return const CreateEventDialog();
                  },
                );
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.edit),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
