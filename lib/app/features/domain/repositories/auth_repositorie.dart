import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:ai_travel_app/app/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositorie {
  Future<Either<Failure, User>> login();
}
