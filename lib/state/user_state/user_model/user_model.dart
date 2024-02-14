import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? uid, // primary key
    String? email,
    String? firstName,
    String? lastName,
    String? username,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.init() => const UserModel(
        uid: null,
        email: null,
        firstName: null,
        lastName: null,
        username: null,
      );
}
