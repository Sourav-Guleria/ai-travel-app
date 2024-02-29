import 'package:ai_travel_app/app/features/presentation/bloc/travel/travel_event.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/travel/travel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TravelBloc extends Bloc<TravelEvent, TravelState> {
  TravelBloc() : super(TravelState());
}
