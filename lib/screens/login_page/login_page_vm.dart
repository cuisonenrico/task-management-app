import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/screens/login_page/login_page_connector.dart';
import 'package:task_management_app/state/actions/login_actions.dart';
import 'package:task_management_app/state/app_state.dart';

class LoginPageVmFactory extends VmFactory<AppState, LoginPageConnector, LoginPageVm> {
  @override
  LoginPageVm fromStore() => LoginPageVm(
        onLogin: _onLogin,
        onLoginGoogle: _onLoginGoogle,
        onChangeUsername: _onChangeUsername,
        onChangePassword: _onChangePassword,
        loginSuccessEvt: _loginSuccessEvt,
      );
  Event<bool>? get _loginSuccessEvt => state.loginSuccessEvt;

  Future<void> _onLoginGoogle() async => await dispatch(LoginWithGoogleAction());
  Future<void> _onLogin() async => await dispatch(LoginUserAction());

  void _onChangeUsername(String username) => dispatch(SetUsernameAction(username));
  void _onChangePassword(String password) => dispatch(SetPasswordAction(password));
}

class LoginPageVm extends Vm {
  LoginPageVm({
    required this.onLogin,
    required this.onLoginGoogle,
    required this.onChangeUsername,
    required this.onChangePassword,
    this.loginSuccessEvt,
  }) : super(equals: [
          loginSuccessEvt,
        ]);

  final VoidCallback onLoginGoogle;
  final VoidCallback onLogin;

  final ValueChanged<String> onChangeUsername;
  final ValueChanged<String> onChangePassword;

  final Event<bool>? loginSuccessEvt;
}
