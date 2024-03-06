import 'package:equatable/equatable.dart';

class TravelEntities extends Equatable {
  final String result;
  const TravelEntities({required this.result});
  @override
  List<Object?> get props => [result];
}
