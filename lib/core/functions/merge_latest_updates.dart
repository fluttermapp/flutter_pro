import 'dart:convert';
import 'package:flutter_pro/core/constants/storage/user_habit_keys.dart';

String? mergeLatestUpdates(
    {required String? remoteJsonString, required String? localJsonString}) {
  if (remoteJsonString == null) {
    return localJsonString;
  }
  if (localJsonString == null) {
    return remoteJsonString;
  }

  Map<String, dynamic> remoteDb = jsonDecode(remoteJsonString);
  Map<String, dynamic> localDb = jsonDecode(localJsonString);

  Map<String, dynamic> progress1 = remoteDb[UserHabitKeys.progress] ?? {};
  Map<String, dynamic> progress2 = localDb[UserHabitKeys.progress] ?? {};

  Map<String, dynamic> mergedDb = {UserHabitKeys.progress: {}};

  Set<String> allDates = {...progress1.keys, ...progress2.keys};

  String latestDbName = remoteDb[UserHabitKeys.name] ?? "Unknown";
  String latestDbNameDate = remoteDb[UserHabitKeys.date] ?? "0000-00-00";
  String latestDbNameLastUpdated =
      remoteDb[UserHabitKeys.lastUpdated] ?? "00-00-00";

  // Compare date fields first
  DateTime remoteDate = remoteDb[UserHabitKeys.date] != null
      ? DateTime.parse(remoteDb[UserHabitKeys.date])
      : DateTime(1900);
  DateTime localDate = localDb[UserHabitKeys.date] != null
      ? DateTime.parse(localDb[UserHabitKeys.date])
      : DateTime(1900);

  if (localDate.isAfter(remoteDate)) {
    latestDbName = localDb[UserHabitKeys.name] ?? "Unknown";
    latestDbNameDate = localDb[UserHabitKeys.date] ?? "0000-00-00";
    latestDbNameLastUpdated = localDb[UserHabitKeys.lastUpdated] ?? "00-00-00";
  } else if (localDate.isAtSameMomentAs(remoteDate)) {
    // If dates are the same, compare last_updated timestamps
    DateTime remoteLastUpdated = parseTimestamp(
        remoteDb[UserHabitKeys.date] ?? '1900-01-01',
        remoteDb[UserHabitKeys.lastUpdated] ?? "00-00-00");
    DateTime localLastUpdated = parseTimestamp(
        localDb[UserHabitKeys.date] ?? '1900-01-01',
        localDb[UserHabitKeys.lastUpdated] ?? "00-00-00");

    if (localLastUpdated.isAfter(remoteLastUpdated)) {
      latestDbName = localDb[UserHabitKeys.name] ?? "Unknown";
      latestDbNameDate = localDb[UserHabitKeys.date] ?? "0000-00-00";
      latestDbNameLastUpdated =
          localDb[UserHabitKeys.lastUpdated] ?? "00-00-00";
    }
  }

  mergedDb[UserHabitKeys.name] = latestDbName;
  mergedDb[UserHabitKeys.date] = latestDbNameDate;
  mergedDb[UserHabitKeys.lastUpdated] = latestDbNameLastUpdated;

  for (String date in allDates) {
    Map<String, dynamic>? entry1 = progress1[date];
    Map<String, dynamic>? entry2 = progress2[date];

    DateTime lastUpdated1 =
        entry1 != null && entry1[UserHabitKeys.lastUpdated] != null
            ? parseTimestamp(date, entry1[UserHabitKeys.lastUpdated])
            : DateTime(1900);
    DateTime lastUpdated2 =
        entry2 != null && entry2[UserHabitKeys.lastUpdated] != null
            ? parseTimestamp(date, entry2[UserHabitKeys.lastUpdated])
            : DateTime(1900);

    Map<String, dynamic> latestEntry =
        lastUpdated1.isAfter(lastUpdated2) ? entry1! : entry2!;

    mergedDb[UserHabitKeys.progress][date] = latestEntry;
  }

  return jsonEncode(mergedDb);
}

DateTime parseTimestamp(String date, String time) {
  try {
    return DateTime.parse("$date ${time.replaceAll('-', ':')}");
  } catch (e) {
    return DateTime(1900);
  }
}
