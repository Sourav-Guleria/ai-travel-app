import 'dart:io';

import 'package:ai_travel_app/app/core/errors/exception.dart';
import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:ai_travel_app/app/core/http_helper/models/request_model.dart';
import 'package:ai_travel_app/app/features/data/data_source/travel_data_source.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:ai_travel_app/app/features/domain/entities/travel_entities.dart';
import 'package:ai_travel_app/app/features/domain/repositories/travel_repositorie.dart';
import 'package:dartz/dartz.dart';

class TravelRepositorieImpl extends TravelRepositorie {
  TravelDataSource travelDataSource;

  TravelRepositorieImpl({
    required this.travelDataSource,
  });

  @override
  Future<Either<Failure, TravelEntities>> getTravelData(
      {required TravelModel travelModel}) async {
    try {
      var response =
          await travelDataSource.getTravelData(travelModel: travelModel);
      if (response.status == RequestStatus.SUCCESS) {
        return Right(
          response.body!,
        );
      } else {
        return Left(
          Error(response.message ?? response.message!),
        );
      }
    } on ServerException {
      return const Left(
        ServerFailure('An error has occurred'),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }
}
