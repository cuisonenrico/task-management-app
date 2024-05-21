import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_management_app/utilities/model_converters/timestamp_converter.dart';

part 'meeting.freezed.dart';
part 'meeting.g.dart';

@freezed
class MeetingModel with _$MeetingModel {
  const factory MeetingModel({
    String? eventName,
    @TimestampConverter() DateTime? from,
    @TimestampConverter() DateTime? to,
    int? status,
    bool? isAllDay,
  }) = _MeetingModel;

  factory MeetingModel.fromJson(Map<String, dynamic> json) => _$MeetingModelFromJson(json);

  factory MeetingModel.init() => const MeetingModel(
        eventName: null,
        from: null,
        to: null,
        status: null,
        isAllDay: null,
      );
}
