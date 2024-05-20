import 'package:async_redux/async_redux.dart';
import 'package:task_management_app/state/app_state.dart';
import 'package:task_management_app/state/meeting_state/model/meeting.dart';

/// Update [meetings] in state based on passed meetings
class DummyMeetingAction extends ReduxAction<AppState> {
  DummyMeetingAction();

  @override
  AppState reduce() {
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
      from: startTime.add(const Duration(days: 1)),
      to: endTime.add(const Duration(days: 1)),
      background: 0,
      isAllDay: false,
    ));
    return state.copyWith.meetingState(meetings: meetings);
  }
}
