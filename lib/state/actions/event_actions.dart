import 'package:async_redux/async_redux.dart';
import 'package:task_management_app/state/actions/user_actions.dart';
import 'package:task_management_app/state/app_state.dart';

class SetLoginSuccessEvt extends ReduxAction<AppState> {
  SetLoginSuccessEvt(this.didSucceed);

  final bool didSucceed;
  @override
  AppState reduce() => state.copyWith(loginSuccessEvt: Event(didSucceed));

  @override
  void after() {
    dispatch(SetUserLoggedInStatus(true));
    super.after();
  }
}
