import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management_app/state/actions/event_actions.dart';
import 'package:task_management_app/state/actions/user_actions.dart';
import 'package:task_management_app/state/app_state.dart';
import 'package:task_management_app/utilities/handlers/user_handler.dart';

/// Sets the [identifier] in loginFormState
class SetUsernameAction extends ReduxAction<AppState> {
  SetUsernameAction(this.username);

  final String username;

  @override
  AppState reduce() {
    if (state.loginFormState.errorMessage != null) dispatch(DisposeErrorMessageAction());

    return state.copyWith.loginFormState(username: username);
  }
}

/// Sets the [password] in loginFormState
class SetPasswordAction extends ReduxAction<AppState> {
  SetPasswordAction(this.password);

  final String password;

  @override
  AppState reduce() {
    if (state.loginFormState.errorMessage != null) dispatch(DisposeErrorMessageAction());

    return state.copyWith.loginFormState(password: password);
  }
}

/// Attempts to login with [Google] and sets user in state
class LoginWithGoogleAction extends ReduxAction<AppState> {
  LoginWithGoogleAction();

  @override
  Future<AppState> reduce() async {
    final user = await UsersHandler().signInWithGoogle();

    final userEntity = user.user;

    if (userEntity == null) return state;

    dispatch(UserLoginAction(userEntity));
    dispatch(SetLoginSuccessEvt(true));

    return state;
  }
}

/// Try login given the credentials in state then set [loginSuccessEvt]
class LoginUserAction extends ReduxAction<AppState> {
  LoginUserAction();

  @override
  Future<AppState> reduce() async {
    final identifier = state.loginFormState.username;
    final password = state.loginFormState.password;

    if (identifier == null || password == null) return state;

    var isSuccess = true;

    try {
      await UsersHandler().signInWithEmailAndPassword(
        email: identifier,
        password: password,
      );
    } on FirebaseAuthException catch (_) {
      isSuccess = false;
    }

    dispatch(SetLoginSuccessEvt(isSuccess));

    return state;
  }
}

/// Disposes [identifier, password] in loginFormState
class DisposeErrorMessageAction extends ReduxAction<AppState> {
  DisposeErrorMessageAction();

  @override
  AppState reduce() => state.copyWith.loginFormState(errorMessage: null);
}
