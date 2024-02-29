import 'package:ai_travel_app/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import 'package:ai_travel_app/app/core/responsive/responsive_width.dart';
import 'package:ai_travel_app/app/core/utils/colors.dart';
import 'package:ai_travel_app/app/core/utils/text_style.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:flutter/material.dart';

class TravelPlan extends StatelessWidget {
  TravelModel travelModel;
  String text;
  TravelPlan({super.key, required this.travelModel, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          travelModel.destination,
          style: CustomTextStyle.textStyle500(
            color: CustomColors.blackColor,
            fontSize: widgetSize(desktop: 20.sp, tablet: 21.sp, mobile: 22.sp),
          ),
        ),
        Text(
          '${travelModel.startDate} to ${travelModel.endDate}',
          style: CustomTextStyle.textStyle500(
            color: CustomColors.blackColor,
            fontSize: widgetSize(desktop: 20.sp, tablet: 21.sp, mobile: 22.sp),
          ),
        ),
        Text(
          'Rs ${travelModel.budget}',
          style: CustomTextStyle.textStyle500(
            color: CustomColors.blackColor,
            fontSize: widgetSize(desktop: 20.sp, tablet: 21.sp, mobile: 22.sp),
          ),
        ),
        Text(
          text,
          style: CustomTextStyle.textStyle500(
            color: CustomColors.blackColor,
            fontSize: widgetSize(desktop: 18.sp, tablet: 19.sp, mobile: 20.sp),
          ),
        ),
      ],
    );
  }
}
