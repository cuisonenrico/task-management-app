import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:setup/screens/main_page/main_page_connector.dart';
import 'package:setup/state/actions/actions.dart';
import 'package:setup/state/app_state.dart';

class MainPageVmFactory extends VmFactory<AppState, MainPageConnector, MainPageVm> {
  @override
  MainPageVm fromStore() => MainPageVm(
        onTap: _onTap,
        counter: state.counter,
      );

  void _onTap(int offset) => dispatch(CounterAction(offset));
}

class MainPageVm extends Vm {
  MainPageVm({
    required this.onTap,
    required this.counter,
  }) : super(equals: [counter]);

  final ValueChanged<int> onTap;
  final int counter;
}
