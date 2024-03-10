import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:ai_travel_app/app/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<User>>> getUsers();

  Future<Either<Failure, bool>> updateUser(User user);

  Future<Either<Failure, User>> getUserByEmail(String email);
}
