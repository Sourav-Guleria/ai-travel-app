import 'package:ai_travel_app/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:ai_travel_app/app/features/presentation/widgets/message_widget.dart';

import 'package:ai_travel_app/app/features/presentation/widgets/travel_plan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:url_launcher/link.dart';

class Travel extends StatefulWidget {
  Travel({super.key, required this.travelModel});
  TravelModel travelModel;
  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  bool _loading = false;

  String promt = '';

  var text = "";
  String apiKey = "AIzaSyDrYADkxZkXRe6BU6SyRr7tifnxNu7pEQ4";

  @override
  void initState() {
    promt =
        "Genrate a Travel Itenery for a trip to ${widget.travelModel.destination} from ${widget.travelModel.startDate} to ${widget.travelModel.endDate}. The travler has a budget of Rs ${widget.travelModel.budget} and is intrested in ${widget.travelModel.activities}. insure a itenery includes mix of popular tourist attractions, dining options, and unique local experinces please provide specific details for each day and including recomended activities, locations, anddinning suggestion.";

    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );
    _chat = _model.startChat();
    _sendChatMessage(promt);
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

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      var response = await _chat.sendMessage(
        Content.text(message),
      );
      text = response.text!;

      if (text == null) {
        text = "Somethin went wrong";
        return;
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
  }
}
