import 'package:ai_travel_app/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import 'package:ai_travel_app/app/core/utils/colors.dart';
import 'package:ai_travel_app/app/features/data/models/activities_model.dart';
import 'package:flutter/material.dart';

class MultipleChips extends StatefulWidget {
 const MultipleChips({super.key, required this.intrestList});
  final List<ActivityModel> intrestList;
  @override
  State<MultipleChips> createState() => _MultipleChipsState();
}

class _MultipleChipsState extends State<MultipleChips> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.intrestList.map(
        (intrest) {
          return GestureDetector(
            onTap: () {
              setState(() {
                intrest.value = !intrest.value;
              });
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.w),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 2.w),
                  decoration: BoxDecoration(
                      color: intrest.value
                          ? CustomColors.appColor
                          : CustomColors.transparent,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                          color: intrest.value
                              ? CustomColors.text
                              : CustomColors.appColor,
                          width: 1)),
                  child: Text(
                    intrest.key,
                    style: TextStyle(
                        color: intrest.value
                            ? CustomColors.blackColor
                            : CustomColors.text,
                        fontSize: 14),
                  ),
                )),
          );
        },
      ).toList(),
    );
  }
}
