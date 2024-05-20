import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management_app/screens/main_page/main_page_connector.dart';
import 'package:task_management_app/state/actions/actions.dart';
import 'package:task_management_app/state/app_state.dart';
import 'package:task_management_app/state/meeting_state/model/meeting.dart';
import 'package:task_management_app/state/user_state/user_model/user_model.dart';

class MainPageVmFactory extends VmFactory<AppState, MainPageConnector, MainPageVm> {
  @override
  MainPageVm fromStore() => MainPageVm(
        onTap: _onTap,
        counter: state.counter,
        user: _user,
        meetings: _getDummyMeetings(),
      );

  UserModel get _user => state.userState.user;

  void _onTap(int offset) => dispatch(CounterAction(offset));

  List<MeetingModel> _getDummyMeetings() {
    final List<MeetingModel> meetings = <MeetingModel>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(MeetingModel(
      eventName: 'Conference',
      from: startTime,
      to: endTime,
      background: 1,
      isAllDay: false,
    ));
    meetings.add(MeetingModel(
      eventName: 'Conference',
      from: startTime.add(Duration(days: 1)),
      to: endTime.add(Duration(days: 1)),
      background: 0,
      isAllDay: false,
    ));
    return meetings;
  }
}

class MainPageVm extends Vm {
  MainPageVm({
    required this.onTap,
    required this.counter,
    required this.user,
    required this.meetings,
  }) : super(equals: [counter, user, meetings]);

  final ValueChanged<int> onTap;
  final int counter;

  final UserModel user;
  final List<MeetingModel> meetings;
}
