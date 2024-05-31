import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:task_management_app/state/app_state.dart';
import 'package:task_management_app/state/meeting_state/model/event.dart';
import 'package:task_management_app/utilities/handlers/meeting_handler.dart';

/// Update [events] in state from database
class GetEventsAction extends ReduxAction<AppState> {
  GetEventsAction();

  @override
  Future<AppState?> reduce() async {
    final userId = state.userState.user.uid;

    if (userId == null) return null;

    final events = await EventsHandler().fetchEvents(userId);

    return state.copyWith.eventState(events: events ?? []);
  }
}

/// Update [newEvent] in state
class OnChangeEventForm extends ReduxAction<AppState> {
  OnChangeEventForm(this.newEvent);

  final EventModel newEvent;
  @override
  AppState? reduce() => state.copyWith.eventState(newEvent: newEvent);
}

/// Disposes [newEvent] in state
class DisposeNewEvent extends ReduxAction<AppState> {
  DisposeNewEvent();

  @override
  AppState? reduce() => state.copyWith.eventState(newEvent: null);
}
