import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_management_app/state/meeting_state/model/meeting.dart';

part 'meeting_state.freezed.dart';
part 'meeting_state.g.dart';

@freezed
class MeetingState with _$MeetingState {
  const factory MeetingState({
    @Default([]) List<MeetingModel> meetings,
  }) = _MeetingState;

  factory MeetingState.fromJson(Map<String, dynamic> json) => _$MeetingStateFromJson(json);

  factory MeetingState.init() => MeetingState(meetings: List.empty());
}
