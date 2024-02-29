

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


import '../http_helper/http_client.dart';


final serviceLocator = GetIt.instance;

void setUpLocator() {
  ///Bloc
  // serviceLocator.registerFactory(
  //   () => HomeBloc(
  //     productsLoadUseCase: serviceLocator(),
  //   ),
  // );


  // ///UseCase
  // serviceLocator.registerLazySingleton(
  //   () => ProductsLoadUseCase(
  //     homeRepository: serviceLocator(),
  //   ),
  // );

  // ///Repository
  // serviceLocator.registerLazySingleton<HomeRepository>(
  //   () => HomeRepositoryImpl(
  //     homeDataSource: serviceLocator(),
  //   ),
  // );

  // ///DataSource
  // serviceLocator.registerLazySingleton<HomeDataSource>(
  //   () => HomeDataSourceImpl(
  //     httpClientManager: serviceLocator(),
  //   ),
  // );

  /// external Setup
  serviceLocator.registerLazySingleton(
    () => http.Client(),
  );
  serviceLocator.registerLazySingleton(
    () => HttpClientManager(),
  );
}