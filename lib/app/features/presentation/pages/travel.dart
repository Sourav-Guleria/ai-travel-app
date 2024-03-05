import 'package:ai_travel_app/app/core/enums/bloc_status_enum.dart';
import 'package:ai_travel_app/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import 'package:ai_travel_app/app/core/shared_widget/common%20widget.dart';
import 'package:ai_travel_app/app/core/utils/colors.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/travel/travel_bloc.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/travel/travel_state.dart';

import 'package:ai_travel_app/app/features/presentation/widgets/travel_plan_widget.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Travel extends StatefulWidget {
  const Travel({super.key, required this.travelModel});
  final TravelModel travelModel;
  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Scaffold(
            body: BlocProvider(
              create: (context) =>
                  TravelBloc()..loadTravelData(widget.travelModel),
              child: BlocBuilder<TravelBloc, TravelState>(
                builder: (context, state) {
                  if (state.status.isLoading) {
                    return loaderWidget();
                  } else if (state.status.isError) {
                    return loginErrorWidget(errorMsg: state.errorMsg);
                  }
                  if (state.status.isLoading) {
                    return SizedBox(
                      height: 100.h,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: CustomColors.text,
                        ),
                      ),
                    );
                  } else if (state.status.isError) {
                    return loginErrorWidget(errorMsg: state.errorMsg);
                  } else if (state.status.isSuccess) {
                    return Container(
                      color: CustomColors.whiteColor,
                      height: 100.h,
                      width: 100.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                        vertical: 2.h,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              color: CustomColors.text,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_rounded)),
                          Expanded(
                            child: SingleChildScrollView(
                              child: TravelPlan(
                                travelModel: widget.travelModel,
                                text: state.data,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          );
        },
        context: context);
  }
}
