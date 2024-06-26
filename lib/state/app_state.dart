import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_management_app/state/login_form_state/login_form_state.dart';
import 'package:task_management_app/state/meeting_state/event_state.dart';
import 'package:task_management_app/state/user_state/user_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    // Sub states
    @Default(UserState()) UserState userState,
    @Default(LoginFormState()) LoginFormState loginFormState,
    @Default(EventState()) EventState eventState,

    // Counter
    @Default(0) int counter,

    // Events
    @JsonKey(includeFromJson: false) Event<bool>? loginSuccessEvt,
    @JsonKey(includeFromJson: false) Event<bool>? passwordMismatchEvt,

    // Wait
    @Default(Wait.empty) @JsonKey(name: 'wait', includeFromJson: false) Wait wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  factory AppState.init() => AppState(wait: Wait());
}

abstract class StateSerializer<St> {
  Map<String, dynamic> encode(St state);

  St decode(Map<String, dynamic> data);
}

class AppStateSerializer extends StateSerializer<AppState> {
  @override
  AppState decode(Map<String, dynamic> data) => AppState.fromJson(data);

  @override
  Map<String, dynamic> encode(AppState state) => state.toJson();
}
