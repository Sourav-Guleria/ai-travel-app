import 'package:ai_travel_app/app/core/constants/custom_strings.dart';
import 'package:ai_travel_app/app/core/enums/bloc_status_enum.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/travel/travel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class TravelBloc extends Cubit<TravelState> {
  TravelBloc() : super(const TravelState());

  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: CustomStrings.apiKey,
  );

  void loadTravelData(TravelModel travelModel
      // LoadTravelData event,
      // Emitter<TravelState> emit,
      ) async {
    try {
      emit(
        state.copyWith(status: BlocStatus.loading),
      );

      String prompt =
          "Genrate a Travel Itenery for a trip to ${travelModel.destination} from ${travelModel.startDate} to ${travelModel.endDate}. The travler has a budget of Rs ${travelModel.budget} and is intrested in ${travelModel.activities}. insure a itenery includes mix of popular tourist attractions, dining options, and unique local experinces please provide specific details for each day and including recomended activities, locations, anddinning suggestion.";

      final response = await _model.generateContent([Content.text(prompt)]);
      String text = response.text!;

      if (text.isEmpty) {
        text = "Somethin went wrong";
        emit(
          state.copyWith(
            status: BlocStatus.error,
            errorMsg: 'Somethin went wrong',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: BlocStatus.success,
            data: text,
          ),
        );
      }
    } catch (e) {
      state.copyWith(status: BlocStatus.error, errorMsg: 'Try Again Later');
    }
  }
}
