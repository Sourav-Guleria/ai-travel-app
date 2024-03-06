import 'package:ai_travel_app/app/core/constants/custom_strings.dart';
import 'package:ai_travel_app/app/core/http_helper/models/request_model.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:ai_travel_app/app/features/domain/entities/travel_entities.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class TravelDataSource {
  Future<RequestStatus<TravelEntities>> getTravelData(
      {required TravelModel travelModel});
}

class TravelDataSourceImpl extends TravelDataSource {
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: CustomStrings.apiKey,
  );

  @override
  Future<RequestStatus<TravelEntities>> getTravelData(
      {required TravelModel travelModel}) async {
    try {
      String prompt =
          "Genrate a Travel Itenery for a trip to ${travelModel.destination} from ${travelModel.startDate} to ${travelModel.endDate}. The travler has a budget of Rs ${travelModel.budget} and is intrested in ${travelModel.activities}. insure a itenery includes mix of popular tourist attractions, dining options, and unique local experinces please provide specific details for each day and including recomended activities, locations, anddinning suggestion.";

      final response = await _model.generateContent([Content.text(prompt)]);
      String text = response.text!;

      return RequestStatus<TravelEntities>(
        RequestStatus.SUCCESS,
        null,
        TravelEntities(result: text),
      );
    } catch (e) {
      return RequestStatus<TravelEntities>(
        RequestStatus.FAILURE,
        "Something Went Wrong",
        null,
      );
    }
  }
}
