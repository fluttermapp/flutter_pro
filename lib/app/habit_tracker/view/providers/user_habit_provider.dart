import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pro/app/habit_tracker/repo/user_habit_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../../data/services/shared_pref_service.dart';
import '../../repo/database_repo.dart';
import 'package:flutter_pro/core/constants/app_formatters.dart';
import 'package:flutter_pro/core/constants/storage/user_habit_keys.dart';
import 'package:intl/intl.dart';

class UserHabitProvider extends ChangeNotifier {
  UserHabitEntity? userHabit;
  Failure? failure;

  UserHabitProvider() {
    _init();
  }

  Future<void> _init() async {
    await eitherFailureOrUserHabitModel();
  }

  Future<void> eitherFailureOrUserHabitModel() async {
    DatabaseRepository repository = DatabaseRepository(SharedPrefService());

    final Either<Failure, UserHabitEntity> failureOrUserHabitModel =
        await repository.getUserHabit();

    failureOrUserHabitModel.fold(
      (newFailure) {
        userHabit = null;
        failure = newFailure;
        notifyListeners();
      },
      (userHabitModel) {
        userHabit = userHabitModel;
        failure = null;
        notifyListeners();
      },
    );
  }

  Future<void> eitherFailureOrUserHabitDateUpdate(
      {required DateTime date}) async {
    DatabaseRepository repository = DatabaseRepository(SharedPrefService());

    userHabit!.progress =
        _updateProgressFromDateTime(userHabit!.progress, date);

    final Either<Failure, UserHabitEntity> failureOrSaveUserHabitModel =
        await repository.setUserHabit(entity: userHabit!);

    failureOrSaveUserHabitModel.fold(
      (newFailure) {
        userHabit = null;
        failure = newFailure;
        notifyListeners();
      },
      (userHabitModel) {
        userHabit = userHabitModel;
        failure = null;
        notifyListeners();
      },
    );
  }

  Future<void> eitherFailureOrUserHabitNameUpdate(
      {required String name}) async {
    DatabaseRepository repository = DatabaseRepository(SharedPrefService());

    userHabit!.name = name;

    final Either<Failure, UserHabitEntity> failureOrSaveUserHabitModel =
        await repository.setUserHabit(entity: userHabit!);

    failureOrSaveUserHabitModel.fold(
      (newFailure) {
        userHabit = null;
        failure = newFailure;
        notifyListeners();
      },
      (userHabitModel) {
        userHabit = userHabitModel;
        failure = null;
        notifyListeners();
      },
    );
  }

  Map<String, Map<String, dynamic>> _updateProgressFromDateTime(
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
}
