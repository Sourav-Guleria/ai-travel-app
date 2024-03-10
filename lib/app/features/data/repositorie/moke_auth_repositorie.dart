import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:ai_travel_app/app/features/domain/entities/user.dart';
import 'package:ai_travel_app/app/features/domain/repositories/auth_repositorie.dart';
import 'package:dartz/dartz.dart';

class MockAuthRepositorie extends AuthRepositorie {
  @override
  Future<Either<Failure, User>> login() async {
    await Future.delayed(const Duration(seconds: 2));
    return right(
      const User.empty().copyWith(
        name: 'Sourav',
        email: 'souravguleria000@gmail.com',
        id: '123456',
      ),
    );
  }
}
