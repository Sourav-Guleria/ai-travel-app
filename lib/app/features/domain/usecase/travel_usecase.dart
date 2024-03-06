import 'package:ai_travel_app/app/core/errors/failure.dart';
import 'package:ai_travel_app/app/core/use_case/use_case.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:ai_travel_app/app/features/domain/entities/travel_entities.dart';
import 'package:ai_travel_app/app/features/domain/repositories/travel_repositorie.dart';
import 'package:dartz/dartz.dart';

class TravelUsecase
    extends UseCase<Either<Failure, TravelEntities>, TravelModel> {
  TravelRepositorie travelRepositorie;
  TravelUsecase({required this.travelRepositorie});
  @override
  Future<Either<Failure, TravelEntities>> call(
      {required TravelModel params}) {
    var response = travelRepositorie.getTravelData(travelModel: params);
    return response;
  }
}
