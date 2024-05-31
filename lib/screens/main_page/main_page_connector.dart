import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/screens/main_page/main_page.dart';
import 'package:task_management_app/screens/main_page/main_page_vm.dart';
import 'package:task_management_app/state/actions/events_actions.dart';
import 'package:task_management_app/state/app_state.dart';

class MainPageConnector extends StatelessWidget {
  const MainPageConnector({super.key});

  static const String routeName = 'my-page';
  static const String route = '/my-page';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageVm>(
      onInit: (store) => store.dispatch(GetEventsAction()),
      vm: () => MainPageVmFactory(),
      builder: (_, vm) => MainPage(
        counter: vm.counter,
        user: vm.user,
        meetings: vm.meetings,
      ),
    );
  }
}
