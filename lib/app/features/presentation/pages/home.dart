import 'package:ai_travel_app/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import 'package:ai_travel_app/app/core/responsive/responsive_width.dart';
import 'package:ai_travel_app/app/core/shared_widget/common%20widget.dart';
import 'package:ai_travel_app/app/core/utils/colors.dart';
import 'package:ai_travel_app/app/core/utils/text_style.dart';
import 'package:ai_travel_app/app/features/data/models/activities_model.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/theme/theme_switcher_bloc.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/theme/theme_switcher_event.dart';
import 'package:ai_travel_app/app/features/presentation/pages/travel.dart';
import 'package:ai_travel_app/app/features/presentation/widgets/calendar_widget.dart';
import 'package:ai_travel_app/app/features/presentation/widgets/mutiple_chips.dart';
import 'package:ai_travel_app/app/features/presentation/widgets/text_field_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:table_calendar/table_calendar.dart';

import '../../../core/mixins/validation_mixin.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with FormValidationMixin {
  bool isSelected = false;

  final _formKey = GlobalKey<FormState>();

  final _destinationTEC = TextEditingController();
  final _startDateTEC = TextEditingController();
  final _endDateTEC = TextEditingController();
  final _budgetTEC = TextEditingController();
  List<ActivityModel> intrestList = [
    ActivityModel(key: 'Shopping', value: false),
    ActivityModel(key: 'Advanture', value: false),
    ActivityModel(key: 'Cusine', value: false),
    ActivityModel(key: 'Nature', value: false)
  ];

  // final _emailFocusNode = FocusNode();
  // final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Form(
            key: _formKey,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: const NetworkImage(
                  //         "https://as2.ftcdn.net/v2/jpg/03/72/75/73/1000_F_372757378_aOASkKDmkQiakQnePuxOZSyLaRaghSW8.jpg"),
                  //     fit: BoxFit.cover,
                  //     colorFilter: ColorFilter.mode(
                  //         Colors.black.withOpacity(0.5), BlendMode.darken),
                  //   ),
                  // ),
                  // color: CustomColors.pureWhite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 5.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Travel Details',
                            style: CustomTextStyle.textStyle500(
                                fontSize: widgetSize(
                                    desktop: 16.sp,
                                    tablet: 15.sp,
                                    mobile: 22.sp),
                                color: CustomColors.blackColor),
                          ),
                          BlocBuilder<ThemeSwitcherBloc, ThemeData>(
                              builder: (context, state) {
                            return IconButton(
                                onPressed: () {
                                  setState(() {
                                    context
                                        .read<ThemeSwitcherBloc>()
                                        .add(ThemeSwitching());
                                    isSelected = !isSelected;
                                  });
                                },
                                icon: state == ThemeData.dark()
                                    ? const Icon(Icons.dark_mode_outlined)
                                    : const Icon(Icons.light_mode_outlined));
                          }),
                        ],
                      ),
                      Text(
                        'Fill out the information below in order to help us better understand your travel plans.',
                        style: CustomTextStyle.textStyle500(
                          color: CustomColors.text,
                          fontSize: widgetSize(
                              desktop: 16.sp, tablet: 17.sp, mobile: 18.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: TextFieldWidget(
                          hintText: 'Enter Destination',
                          textEditingController: _destinationTEC,
                          validator: validateEmpty,
                        ),
                      ),
                      Text('Select date range for your travel',
                          style: CustomTextStyle.textStyle500(
                            color: CustomColors.blackColor,
                            fontSize: widgetSize(
                                desktop: 16.sp, tablet: 17.sp, mobile: 18.sp),
                          )),
                      Calender(
                        startDateTec: _startDateTEC,
                        endDateTec: _endDateTEC,
                      ),
                      TextFieldWidget(
                        hintText: 'Start date',
                        readOnly: true,
                        textEditingController: _startDateTEC,
                        validator: validateEmpty,
                      ),
                      TextFieldWidget(
                        hintText: 'End date',
                        readOnly: true,
                        textEditingController: _endDateTEC,
                        validator: validateEmpty,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.h,
                        ),
                        child:
                            Text('Specify your budget (In USD) for the travel',
                                style: CustomTextStyle.textStyle500(
                                  color: CustomColors.blackColor,
                                  fontSize: widgetSize(
                                      desktop: 14.sp,
                                      tablet: 15.sp,
                                      mobile: 16.sp),
                                )),
                      ),
                      TextFieldWidget(
                        hintText: '5000',
                        textEditingController: _budgetTEC,
                        validator: validateEmpty,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 1.h,
                        ),
                        child: Text('Intrest/Activities',
                            style: CustomTextStyle.textStyle500(
                              color: CustomColors.blackColor,
                              fontSize: widgetSize(
                                  desktop: 16.sp, tablet: 17.sp, mobile: 18.sp),
                            )),
                      ),
                      Text('Please selec All kind of activities you want to do',
                          style: CustomTextStyle.textStyle500(
                            color: CustomColors.text,
                            fontSize: widgetSize(
                                desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
                          )),
                      MultipleChips(
                        intrestList: intrestList,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.h,
                        ),
                        child: customButton(
                          text: 'Genrate Travel Plan',
                          buttonColor: CustomColors.text,
                          onTap: () {
                            TravelModel travelModel = TravelModel(
                                destination: _destinationTEC.text,
                                startDate: _startDateTEC.text,
                                endDate: _endDateTEC.text,
                                budget: _budgetTEC.text,
                                activities: intrestList
                                    .where((element) => element.value)
                                    .toList());
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Travel(
                                            travelModel: travelModel,
                                          )));
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        context: context);
  }
}
