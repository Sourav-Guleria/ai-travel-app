import 'package:ai_travel_app/app/core/constants/custom_strings.dart';
import 'package:ai_travel_app/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';

import 'package:ai_travel_app/app/features/presentation/widgets/travel_plan_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Travel extends StatefulWidget {
 const Travel({super.key, required this.travelModel});
  final TravelModel travelModel;
  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  late final GenerativeModel _model;

  bool _loading = false;

  String prompt = '';

  var text = "";
  String apiKey = CustomStrings.apiKey;

  Future<String> generateContentFromText(
      {required String prompt, required GenerativeModel model}) async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await model.generateContent([Content.text(prompt)]);
      text = response.text!;

      if (text.isEmpty) {
        text = "Somethin went wrong";
        return text;
      } else {
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      text = e as String;
      setState(() {
        _loading = false;
      });
    }
    return text;
  }

  @override
  void initState() {
    prompt =
        "Genrate a Travel Itenery for a trip to ${widget.travelModel.destination} from ${widget.travelModel.startDate} to ${widget.travelModel.endDate}. The travler has a budget of Rs ${widget.travelModel.budget} and is intrested in ${widget.travelModel.activities}. insure a itenery includes mix of popular tourist attractions, dining options, and unique local experinces please provide specific details for each day and including recomended activities, locations, anddinning suggestion.";

    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );
    generateContentFromText(prompt: prompt, model: _model);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Scaffold(
            body: Container(
              height: 100.h,
              width: 100.w,
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 5.h,
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: const NetworkImage(
              //         "https://as2.ftcdn.net/v2/jpg/03/72/75/73/1000_F_372757378_aOASkKDmkQiakQnePuxOZSyLaRaghSW8.jpg"),
              //     fit: BoxFit.cover,
              //     colorFilter: ColorFilter.mode(
              //         Colors.black.withOpacity(0.5), BlendMode.darken),
              //   ),
              // ),
              child: SingleChildScrollView(
                child: _loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_rounded)),
                            ],
                          ),
                          TravelPlan(
                            travelModel: widget.travelModel,
                            text: text,
                          ),
                        ],
                      ),
              ),
            ),
          );
        },
        context: context);
  }
}
