import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_management_app/utilities/model_converters/timestamp_converter.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    String? eventName,
    String? description,
    @TimestampConverter() DateTime? date,
    @TimestampConverter() DateTime? from,
    @TimestampConverter() DateTime? to,
    int? status,
    @Default(false) bool isAllDay,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);

  factory EventModel.init() => const EventModel(
        eventName: null,
        description: null,
        date: null,
        from: null,
        to: null,
        status: null,
        isAllDay: false,
      );

  @override
  Map<String, dynamic> toJson() => {
        'eventName': eventName,
        'description': description,
        'from': from,
        'to': to,
        'status': status,
        'isAllDay': isAllDay,
      };
}
