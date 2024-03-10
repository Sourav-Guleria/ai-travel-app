import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LocalStorageRepository {
  Future<Either<Failure, bool>> setString(String key, String value);

  Future<Either<Failure, String>> getString(String key);

  Future<Either<Failure, bool>> setBool(String key, bool value);

  Future<Either<Failure, bool>> getBool(String key);
}
