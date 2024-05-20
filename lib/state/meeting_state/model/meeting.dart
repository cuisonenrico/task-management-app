import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting.freezed.dart';
part 'meeting.g.dart';

@freezed
class MeetingModel with _$MeetingModel {
  const factory MeetingModel({
    String? eventName,
    DateTime? from,
    DateTime? to,
    int? background,
    bool? isAllDay,
  }) = _MeetingModel;

  factory MeetingModel.fromJson(Map<String, dynamic> json) => _$MeetingModelFromJson(json);

  factory MeetingModel.init() => const MeetingModel(
        eventName: null,
        from: null,
        to: null,
        background: null,
        isAllDay: null,
      );
}
