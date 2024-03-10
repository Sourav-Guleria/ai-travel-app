import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:ai_travel_app/app/features/domain/entities/user.dart';
import 'package:ai_travel_app/app/features/domain/repositories/local_storage_repositorie.dart';
import 'package:ai_travel_app/app/features/domain/repositories/user_repositorie.dart';
import 'package:ai_travel_app/app/features/domain/store/user_store.dart';
import 'package:dartz/dartz.dart';

class CheckForExistingUserUseCase {
  final UsersRepository _usersRepository;
  final LocalStorageRepository _localStorageRepository;
  final UserStore _userStore;

  CheckForExistingUserUseCase(
    this._usersRepository,
    this._localStorageRepository,
    this._userStore,
  );

  Future<Either<Failure, User>> execute() {
    return _localStorageRepository.getString('USER_EMAIL').then(
          (value) => value.fold(
            (l) => left(Error(l.message)),
            (email) {
              if (email.isNotEmpty) {
                return _usersRepository.getUserByEmail(email).then(
                      (value) => value.fold(
                        (l) => left(Error(l.message)),
                        (user) {
                          _userStore.setUser(user);
                          return right(user);
                        },
                      ),
                    );
              }
              return left(const Error('User doesn\'t exist '));
            },
          ),
        );
  }
}
