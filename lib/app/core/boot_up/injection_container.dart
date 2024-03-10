import 'package:ai_travel_app/app/config/routes/app_navigator/app_navigator.dart';
import 'package:ai_travel_app/app/config/routes/app_navigator/home_navigator.dart';
import 'package:ai_travel_app/app/config/routes/app_navigator/onboarding_navigator.dart';
import 'package:ai_travel_app/app/features/data/data_source/travel_data_source.dart';
import 'package:ai_travel_app/app/features/data/repositorie/inscure_storage_repositorie.dart';
import 'package:ai_travel_app/app/features/data/repositorie/moke_auth_repositorie.dart';
import 'package:ai_travel_app/app/features/data/repositorie/moke_user_repository.dart';
import 'package:ai_travel_app/app/features/data/repositorie/travel_repositorie_impl.dart';
import 'package:ai_travel_app/app/features/domain/repositories/auth_repositorie.dart';
import 'package:ai_travel_app/app/features/domain/repositories/local_storage_repositorie.dart';
import 'package:ai_travel_app/app/features/domain/repositories/travel_repositorie.dart';
import 'package:ai_travel_app/app/features/domain/repositories/user_repositorie.dart';
import 'package:ai_travel_app/app/features/domain/store/user_store.dart';
import 'package:ai_travel_app/app/features/domain/usecase/existing_user_usecase.dart';
import 'package:ai_travel_app/app/features/domain/usecase/social_login_usecase.dart';
import 'package:ai_travel_app/app/features/domain/usecase/travel_usecase.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/travel/travel_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../http_helper/http_client.dart';

final serviceLocator = GetIt.instance;

void setUpLocator() {
  //Bloc
  serviceLocator.registerFactory(
    () => TravelBloc(
      travelUsecase: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => OnboardingCubit(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  ///UseCase
  serviceLocator.registerLazySingleton(
    () => TravelUsecase(
      travelRepositorie: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => SocialLoginUseCase(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => CheckForExistingUserUseCase(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  ///Repository
  serviceLocator.registerLazySingleton<TravelRepositorie>(
    () => TravelRepositorieImpl(
      travelDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthRepositorie>(
    () => MockAuthRepositorie(),
  );
  serviceLocator.registerLazySingleton<LocalStorageRepository>(
    () => InsecureLocalStorageRepository(),
  );
  serviceLocator.registerLazySingleton<UsersRepository>(
    () => MockUsersRepository(),
  );

  ///DataSource
  serviceLocator.registerLazySingleton<TravelDataSource>(
    () => TravelDataSourceImpl(),
  );

  /// store
  serviceLocator.registerLazySingleton(
    () => UserStore(),
  );

  /// Navigator
  serviceLocator.registerLazySingleton(
    () => AppNavigator(),
  );
  serviceLocator.registerLazySingleton(
    () => HomeMasterNavigator(),
  );
  serviceLocator.registerLazySingleton(
    () => OnboardingNavigator(
      serviceLocator(),
    ),
  );

  /// external Setup
  serviceLocator.registerLazySingleton(
    () => http.Client(),
  );
  serviceLocator.registerLazySingleton(
    () => HttpClientManager(),
  );
}
