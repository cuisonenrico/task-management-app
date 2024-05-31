import 'package:intl/intl.dart';

extension DateTimeExt on DateTime? {
  String? toTimeFormatted(String placeHolder) => this == null ? placeHolder : DateFormat('hh:mm a').format(this!);
}
