import 'package:ai_travel_app/app/features/data/models/activities_model.dart';

class TravelModel {
  String destination;
  String startDate;
  String endDate;
  String budget;
  List<ActivityModel> activities;

  TravelModel({
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.budget,
    required this.activities,
  });
}
