import 'dart:convert';

import 'package:flutter_pro/app/habit_tracker/repo/user_habit_entity.dart';
import 'package:flutter_pro/core/constants/words.dart';
import '../../../../core/constants/storage/user_habit_keys.dart';

class UserHabitModel {
  static UserHabitEntity createEntity() {
    return UserHabitEntity(
      name: Words.exercise,
    );
  }

  static UserHabitEntity fromStringToEntity({required String jsonString}) {
    Map<String, dynamic> map = json.decode(jsonString);
    return UserHabitEntity(
      name: map[UserHabitKeys.name],
      progress: (map[UserHabitKeys.progress] as Map<String, dynamic>?)!.map(
        (key, value) => MapEntry(key, value as Map<String, dynamic>),
      ),
    );
  }

  static String fromEntityToJsonString({required UserHabitEntity entity}) {
    Map<String, dynamic> map = {
      UserHabitKeys.name: entity.name,
      UserHabitKeys.progress: entity.progress,
    };
    return json.encode(map);
  }
}
