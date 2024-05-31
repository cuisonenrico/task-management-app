import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_management_app/state/meeting_state/model/event.dart';

part 'event_state.freezed.dart';
part 'event_state.g.dart';

@freezed
class EventState with _$EventState {
  const factory EventState({
    @Default([]) List<EventModel> events,
    EventModel? newEvent,
  }) = _EventState;

  factory EventState.fromJson(Map<String, dynamic> json) => _$EventStateFromJson(json);

  factory EventState.init() => EventState(
        events: List.empty(),
        newEvent: null,
      );
}
