import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:ai_travel_app/app/features/domain/entities/user.dart';
import 'package:ai_travel_app/app/features/domain/repositories/auth_repositorie.dart';
import 'package:ai_travel_app/app/features/domain/repositories/local_storage_repositorie.dart';
import 'package:ai_travel_app/app/features/domain/repositories/user_repositorie.dart';
import 'package:ai_travel_app/app/features/domain/store/user_store.dart';
import 'package:dartz/dartz.dart';

class SocialLoginUseCase {
  final AuthRepositorie _authRepository;
  final UserStore _userStore;
  final UsersRepository _usersRepository;
  final LocalStorageRepository _localStorageRepository;

  SocialLoginUseCase(
    this._authRepository,
    this._userStore,
    this._usersRepository,
    this._localStorageRepository,
  );

  Future<Either<Failure, User>> execute() => _authRepository.login().then(
        (value) => value.fold(
          (l) => left(l),
          (user) {
            return _usersRepository.updateUser(user).then(
                  (value) => value.fold(
                    (fail) => left(Error(fail.message)),
                    (r) => _localStorageRepository
                        .setString('USER_EMAIL', user.email)
                        .then(
                          (value) => value.fold(
                            (l) => left(Error(l.message)),
                            (r) {
                              _userStore.setUser(user);
                              return right(user);
                            },
                          ),
                        ),
                  ),
                );
          },
        ),
      );
}
