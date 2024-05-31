import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/screens/create_event/create_event_connector.dart';
import 'package:task_management_app/state/actions/events_actions.dart';
import 'package:task_management_app/state/app_state.dart';
import 'package:task_management_app/state/meeting_state/model/event.dart';

class CreateEventVmFactory extends VmFactory<AppState, CreateEventConnector, CreateEventVm> {
  @override
  CreateEventVm? fromStore() => CreateEventVm(
        onChangedEvent: _onChangedEvent,
        event: _event,
      );

  EventModel? get _event => state.eventState.newEvent;

  void _onChangedEvent(EventModel newEvent) => dispatch(OnChangeEventForm(newEvent));
}

class CreateEventVm extends Vm {
  CreateEventVm({
    required this.onChangedEvent,
    required this.event,
  }) : super(equals: [
          event,
        ]);

  final ValueChanged<EventModel> onChangedEvent;
  final EventModel? event;
}
