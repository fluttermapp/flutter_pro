import 'package:dartz/dartz.dart';
import 'package:flutter_pro/app/habit_tracker/repo/user_habit_entity.dart';
import 'package:flutter_pro/core/constants/storage/storage_keys.dart';
import 'package:flutter_pro/core/errors/error_message.dart';

import '../../../core/errors/failure.dart';
import '../data/models/user_habit_model.dart';
import '../data/services/shared_pref_service.dart';

class DatabaseRepository {
  final SharedPrefService _sharedPrefService;
  DatabaseRepository(
    this._sharedPrefService,
  );

  Future<Either<Failure, UserHabitEntity>> getUserHabit() async {
    try {
      String? jsonString =
          await _sharedPrefService.getData(path: StorageKeys.userHabit);
      if (jsonString == null || jsonString.isEmpty) {
        return Right(UserHabitModel.createEntity());
      }
      UserHabitEntity userHabitEntity =
          UserHabitModel.fromStringToEntity(jsonString: jsonString);
      return Right(userHabitEntity);
    } catch (e) {
      return Left(CacheFailure(errorMessage: ErrorMessage.noLocalDataFound));
    }
  }

  Future<Either<Failure, UserHabitEntity>> setUserHabit(
      {required UserHabitEntity entity}) async {
    try {
      String jsonString = UserHabitModel.fromEntityToJsonString(entity: entity);
      await _sharedPrefService.saveData(
          jsonString: jsonString, path: StorageKeys.userHabit);
      return Right(entity);
    } catch (e) {
      return Left(CacheFailure(errorMessage: ErrorMessage.noLocalDataSaved));
    }
  }
}
