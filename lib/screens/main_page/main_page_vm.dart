import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management_app/screens/main_page/main_page_connector.dart';
import 'package:task_management_app/state/actions/actions.dart';
import 'package:task_management_app/state/app_state.dart';
import 'package:task_management_app/state/user_state/user_model/user_model.dart';

class MainPageVmFactory extends VmFactory<AppState, MainPageConnector, MainPageVm> {
  @override
  MainPageVm fromStore() => MainPageVm(
        onTap: _onTap,
        counter: state.counter,
        user: _user,
      );

  UserModel get _user => state.userState.user;

  void _onTap(int offset) => dispatch(CounterAction(offset));
}

class MainPageVm extends Vm {
  MainPageVm({
    required this.onTap,
    required this.counter,
    required this.user,
  }) : super(equals: [
          counter,
          user,
        ]);

  final ValueChanged<int> onTap;
  final int counter;

  final UserModel user;
}
