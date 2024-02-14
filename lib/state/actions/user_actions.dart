import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management_app/state/app_state.dart';
import 'package:task_management_app/utilities/handlers/user_handler.dart';

/// Sets [isLoggedIn] status in state
class SetUserLoggedInStatus extends ReduxAction<AppState> {
  SetUserLoggedInStatus(this.isLoggedIn);

  final bool isLoggedIn;

  @override
  AppState reduce() => state.copyWith.userState(isLoggedIn: isLoggedIn);
}

/// Sets the logged in [userState]
class UserLoginAction extends ReduxAction<AppState> {
  UserLoginAction(this.firebaseUser);

  final User firebaseUser;

  @override
  Future<AppState> reduce() async {
    final user = await UsersHandler().userLogin(firebaseUser);

    if (user == null) return state;

    return state.copyWith.userState(user: user);
  }

  @override
  void after() {
    // TODO: optimize this
    dispatch(SetUserLoggedInStatus(true));
    super.after();
  }
}
