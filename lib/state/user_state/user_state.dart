import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_management_app/state/user_state/user_model/user_model.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isLoggedIn,
    @Default(UserModel()) UserModel user,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) => _$UserStateFromJson(json);

  factory UserState.init() => const UserState();
}
