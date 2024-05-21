import 'package:async_redux/async_redux.dart';
import 'package:task_management_app/state/app_state.dart';
import 'package:task_management_app/utilities/handlers/meeting_handler.dart';

/// Update [meetings] in state from database
class GetMeetingsAction extends ReduxAction<AppState> {
  GetMeetingsAction();

  @override
  Future<AppState?> reduce() async {
    final userId = state.userState.user.uid;

    if (userId == null) return null;

    final meetings = await MeetingHandler().fetchMeetings(userId);

    return state.copyWith.meetingState(meetings: meetings ?? []);
  }
}
