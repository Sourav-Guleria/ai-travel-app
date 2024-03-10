import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:ai_travel_app/app/features/domain/entities/user.dart';
import 'package:ai_travel_app/app/features/domain/repositories/user_repositorie.dart';
import 'package:dartz/dartz.dart';

class MockUsersRepository implements UsersRepository {
  @override
  Future<Either<Failure, List<User>>> getUsers() async => right([
        const User(
          id: '123',
          name: 'name',
          username: 'username',
          email: 'email',
          phone: 'phone',
          website: 'website',
        )
      ]);

  @override
  Future<Either<Failure, bool>> updateUser(User user) async {
    await Future.delayed(const Duration(seconds: 1));
    return right(true);
  }

  @override
  Future<Either<Failure, User>> getUserByEmail(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    return right(
      const User.empty().copyWith(
        name: 'Sourav',
        email: 'souravguleria000@gmail.com',
        id: '123456',
      ),
    );
  }
}
