import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.freezed.dart';
part 'login_form_state.g.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    String? username,
    String? password,
    String? errorMessage,
  }) = _LoginFormState;

  factory LoginFormState.fromJson(Map<String, dynamic> json) => _$LoginFormStateFromJson(json);

  factory LoginFormState.init() => const LoginFormState();
}
