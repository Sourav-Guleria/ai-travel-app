import 'package:ai_travel_app/app/core/enums/bloc_status_enum.dart';
import 'package:ai_travel_app/app/features/domain/entities/travel_entities.dart';
import 'package:equatable/equatable.dart';

class TravelState extends Equatable {
  final BlocStatus status;
  final TravelEntities? travelEntities;
  final String errorMsg;

  const TravelState({
    this.status = BlocStatus.initial,
    this.travelEntities,
    this.errorMsg = "",
  });

  @override
  List<Object?> get props => [status, travelEntities, errorMsg];

  TravelState copyWith({
    BlocStatus? status,
    TravelEntities? travelEntities,
    String? errorMsg,
  }) {
    return TravelState(
      status: status ?? this.status,
      travelEntities: travelEntities ?? this.travelEntities,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
