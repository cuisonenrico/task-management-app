import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/screens/create_event/create_event.dart';
import 'package:task_management_app/screens/create_event/create_event_vm.dart';
import 'package:task_management_app/state/actions/events_actions.dart';
import 'package:task_management_app/state/app_state.dart';

class CreateEventConnector extends StatelessWidget {
  const CreateEventConnector({super.key});

  static const String routeName = 'create-event';
  static const String route = 'create-event';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CreateEventVm>(
      vm: () => CreateEventVmFactory(),
      onDispose: (store) => store.dispatch(DisposeNewEvent()),
      builder: (context, vm) => CreateEvent(
        onChangedEvent: vm.onChangedEvent,
        newEvent: vm.event,
      ),
    );
  }
}
