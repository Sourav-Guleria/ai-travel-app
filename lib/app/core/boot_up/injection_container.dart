import 'package:ai_travel_app/app/features/data/data_source/travel_data_source.dart';
import 'package:ai_travel_app/app/features/data/repositorie/travel_repositorie_impl.dart';
import 'package:ai_travel_app/app/features/domain/repositories/travel_repositorie.dart';
import 'package:ai_travel_app/app/features/domain/usecase/travel_usecase.dart';
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

  ///UseCase
  serviceLocator.registerLazySingleton(
    () => TravelUsecase(
      travelRepositorie: serviceLocator(),
    ),
  );

  ///Repository
  serviceLocator.registerLazySingleton<TravelRepositorie>(
    () => TravelRepositorieImpl(
      travelDataSource: serviceLocator(),
    ),
  );

  ///DataSource
  serviceLocator.registerLazySingleton<TravelDataSource>(
    () => TravelDataSourceImpl(),
  );

  /// external Setup
  serviceLocator.registerLazySingleton(
    () => http.Client(),
  );
  serviceLocator.registerLazySingleton(
    () => HttpClientManager(),
  );
}
