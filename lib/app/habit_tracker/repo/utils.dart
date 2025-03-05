import 'package:flutter_pro/core/constants/app_formatters.dart';
import 'package:flutter_pro/core/constants/storage/user_habit_keys.dart';
import 'package:intl/intl.dart';

DateTime fromDaysAgoToDate(int daysAgo) {
  DateTime targetDate = DateTime.now().subtract(Duration(days: daysAgo));
  return targetDate;
}

Map<String, Map<String, dynamic>> updateProgressFromDateTime(
    Map<String, Map<String, dynamic>> progress, DateTime date) {
  String formattedDate =
      DateFormat(AppFormatters.dateFormatyyyyMMdd).format(date);
  String formattedTime =
      DateFormat(AppFormatters.dateFormatHHmmss).format(DateTime.now());
  progress.update(
    formattedDate,
    (Map<String, dynamic> values) => {
      UserHabitKeys.lastUpdated: formattedTime,
      UserHabitKeys.count: (values[UserHabitKeys.count] as int) == 0 ? 1 : 0,
    },
    ifAbsent: () => {
      UserHabitKeys.lastUpdated: formattedTime,
      UserHabitKeys.count: 1,
    },
  );
  return progress;
}
