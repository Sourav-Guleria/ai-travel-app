import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:ai_travel_app/app/features/domain/entities/travel_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class TravelRepositorie {
  Future<Either<Failure, TravelEntities>> getTravelData({required TravelModel travelModel});
}
