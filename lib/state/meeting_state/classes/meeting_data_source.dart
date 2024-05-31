import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_management_app/state/meeting_state/model/event.dart';
import 'package:task_management_app/utilities/enum/background_enum.dart';

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<EventModel> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => _getMeetingData(index).from ?? DateTime.now();

  @override
  DateTime getEndTime(int index) => _getMeetingData(index).to == null
      ? _getMeetingData(index).from ?? DateTime.now()
      : _getMeetingData(index).to ?? DateTime.now();

  @override
  String getSubject(int index) => _getMeetingData(index).eventName ?? '';

  @override
  Color getColor(int index) {
    return _getMeetingData(index).status == null
        ? Colors.green
        : BackgroundColor.values[_getMeetingData(index).status!].color;
  }

  @override
  bool isAllDay(int index) => _getMeetingData(index).isAllDay;

  EventModel _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final EventModel meetingData;
    if (meeting is EventModel) {
      meetingData = meeting;
    }

    return meetingData;
  }
}
