import 'package:intl/intl.dart';

class DateFormatHelper {
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy - hh:mm a').format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  static String formatDayMonthYear(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }
}
