// TODO: Refactor repeated code
import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:ai_travel_app/app/features/domain/repositories/local_storage_repositorie.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsecureLocalStorageRepository implements LocalStorageRepository {
  @override
  Future<Either<Failure, String>> getString(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return right(prefs.getString(key) ?? '');
    } catch (ex) {
      return left(
        Error(ex.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> setString(String key, String value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
      return right(true);
    } catch (ex) {
      return left(
        Error(ex.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> getBool(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return right(prefs.getBool(key) ?? false);
    } catch (ex) {
      return left(
        Error(ex.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> setBool(String key, bool value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
      return right(true);
    } catch (ex) {
      return left(
        Error(ex.toString()),
      );
    }
  }
}
