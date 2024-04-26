import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management_app/screens/login_page/login_page.dart';
import 'package:task_management_app/screens/login_page/login_page_vm.dart';
import 'package:task_management_app/screens/main_page/main_page_connector.dart';
import 'package:task_management_app/state/app_state.dart';
import 'package:task_management_app/utilities/app_router.dart';

class LoginPageConnector extends StatelessWidget {
  const LoginPageConnector({super.key});

  static const routeName = 'login-page';
  static const route = '/login-page';

  void _consumeEvents(LoginPageVm vm) {
    if (vm.loginSuccessEvt?.isNotSpent == true) {
      final loginSuccess = vm.loginSuccessEvt?.consume();

      if (loginSuccess == true) {
        router.pushNamed(MainPageConnector.routeName);
      } else {
        // vm.onDisposeCredentials();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginPageVm>(
      vm: () => LoginPageVmFactory(),
      onDidChange: (_, __, vm) => _consumeEvents(vm),
      builder: (_, vm) => LoginPage(
        onLogin: vm.onLogin,
        onLoginGoogle: vm.onLoginGoogle,
        onChangeUsername: vm.onChangeUsername,
        onChangePassword: vm.onChangePassword,
      ),
    );
  }
}
