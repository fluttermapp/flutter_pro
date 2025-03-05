import 'package:flutter_pro/core/constants/storage/user_habit_keys.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_formatters.dart';

class UserHabitEntity {
  String name;
  Map<String, Map<String, dynamic>>
      progress; // {yyyy-mm-dd: {last_updated: hh-mm-dd, count: 0}}

  UserHabitEntity({
    required this.name,
    this.progress = const {},
  });

  int getProgress(int daysAgo) {
    DateTime targetDate = DateTime.now().subtract(Duration(days: daysAgo));
    return getProgressFromDateTime(targetDate);
  }

  int getProgressFromDateTime(DateTime date) {
    String formattedDate =
        DateFormat(AppFormatters.dateFormatyyyyMMdd).format(date);
    return progress[formattedDate]?[UserHabitKeys.count] ?? 0;
  }

  bool isCompleted(int daysAgo) => getProgress(daysAgo) == 1;
}
