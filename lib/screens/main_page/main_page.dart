import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_management_app/screens/widgets/app_bar.dart';
import 'package:task_management_app/screens/widgets/app_scaffold.dart';
import 'package:task_management_app/state/user_state/user_model/user_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    required this.onTap,
    required this.counter,
    required this.user,
    super.key,
  });

  final int counter;
  final ValueChanged<int> onTap;

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const MyAppBar(
        isSecondaryIconVisible: true,
        isBackButtonVisible: true,
        isMessagingIconVisible: false,
        isCornersRounded: false,
      ),
      body: SfCalendar(
        view: CalendarView.month,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onTap(1),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
