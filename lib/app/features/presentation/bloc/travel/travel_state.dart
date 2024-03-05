import 'package:ai_travel_app/app/core/enums/bloc_status_enum.dart';
import 'package:equatable/equatable.dart';

class TravelState extends Equatable {
  final BlocStatus status;
  final String data;
  final String errorMsg;

  const TravelState({
    this.status = BlocStatus.initial,
    this.data = "",
    this.errorMsg = "",
  });

  @override
  List<Object?> get props => [status, data, errorMsg];

  TravelState copyWith({
    BlocStatus? status,
    String? data,
    String? errorMsg,
  }) {
    return TravelState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
