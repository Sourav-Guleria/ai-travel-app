
import 'package:ai_travel_app/app/core/enums/bloc_status_enum.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:ai_travel_app/app/features/domain/usecase/travel_usecase.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/travel/travel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TravelBloc extends Cubit<TravelState> {
  TravelBloc({required this.travelUsecase}) : super(const TravelState());

  TravelUsecase travelUsecase;

  void onInit(TravelModel travelModel) async {
    try {
      emit(
        state.copyWith(status: BlocStatus.loading),
      );

      var response = await travelUsecase.call(params: travelModel);
      response.fold(
        (fail) => emit(
          state.copyWith(
            status: BlocStatus.error,
            errorMsg: fail.message,
          ),
        ),
        (res) => emit(
          state.copyWith(
            status: BlocStatus.success,
            travelEntities: res,
          ),
        ),
      );
    } catch (e) {
      state.copyWith(status: BlocStatus.error, errorMsg: 'Try Again Later');
    }
  }
}
