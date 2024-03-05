import 'package:ai_travel_app/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import '../responsive/responsive_width.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';
import '/app/config/flavors/flavor.dart' as app_flavors;
import 'package:universal_html/html.dart' as html;

Widget customButton({
  required String text,
  required Color buttonColor,
  required Function() onTap,
  Color? textColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20.sp),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widgetSize(desktop: 2.w, tablet: 3.w, mobile: 4.w),
        vertical: 1.h,
      ),
      child: Text(
        text,
        style: CustomTextStyle.textStyle500(
          fontSize: widgetSize(desktop: 16.sp, tablet: 17.sp, mobile: 18.sp),
          color: textColor ?? CustomColors.whiteColor,
        ),
      ),
    ),
  );
}

Widget errorWidget({required String errorMsg}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 20.h,
      horizontal: 20.h,
    ),
    child: Center(
      child: Text(
        errorMsg,
        style: CustomTextStyle.textStyle700(),
      ),
    ),
  );
}

Widget loginErrorWidget({required String errorMsg}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Text(
          errorMsg,
          style: CustomTextStyle.textStyle500(
            fontSize: 15.sp,
            color: CustomColors.blackColor,
          ),
        ),
      ),
      SizedBox(
        height: 3.h,
      ),
      customButton(
        text: "Login",
        buttonColor: CustomColors.buttonBlueColor,
        onTap: () {
          String baseUrl = app_flavors.Flavor.I.getString('devHttpsBaseUrl') ??
              'https://dev.swayam.jio.com';

          html.window.open(baseUrl, "_self");
        },
        textColor: CustomColors.whiteColor,
      ),
    ],
  );
}

Widget loaderWidget({EdgeInsets? padding}) {
  return Padding(
    padding: padding ?? EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
    child: const Center(
      child: CircularProgressIndicator(
        color: CustomColors.text,
      ),
    ),
  );
}
