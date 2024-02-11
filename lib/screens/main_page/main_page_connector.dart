import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:setup/screens/main_page/main_page.dart';
import 'package:setup/screens/main_page/main_page_vm.dart';
import 'package:setup/state/app_state.dart';

class MainPageConnector extends StatelessWidget {
  const MainPageConnector({super.key});

  static const String routeName = 'my-page';
  static const String route = '/my-page';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageVm>(
      vm: () => MainPageVmFactory(),
      builder: (_, vm) => MainPage(
        onTap: vm.onTap,
        counter: vm.counter,
      ),
    );
  }
}
