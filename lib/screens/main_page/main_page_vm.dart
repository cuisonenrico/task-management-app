import 'package:async_redux/async_redux.dart';
import 'package:task_management_app/screens/main_page/main_page_connector.dart';
import 'package:task_management_app/state/app_state.dart';
import 'package:task_management_app/state/meeting_state/model/meeting.dart';
import 'package:task_management_app/state/user_state/user_model/user_model.dart';

class MainPageVmFactory extends VmFactory<AppState, MainPageConnector, MainPageVm> {
  @override
  MainPageVm fromStore() => MainPageVm(
        counter: state.counter,
        user: _user,
        meetings: _meetings,
      );

  UserModel get _user => state.userState.user;

  List<MeetingModel> get _meetings => state.meetingState.meetings;
}

class MainPageVm extends Vm {
  MainPageVm({
    required this.counter,
    required this.user,
    required this.meetings,
  }) : super(equals: [counter, user, meetings]);

  final int counter;

  final UserModel user;
  final List<MeetingModel> meetings;
}
