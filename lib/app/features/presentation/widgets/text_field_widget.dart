import 'package:ai_travel_app/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import 'package:ai_travel_app/app/core/responsive/responsive_width.dart';
import 'package:ai_travel_app/app/core/utils/colors.dart';
import 'package:ai_travel_app/app/core/utils/style.dart';
import 'package:ai_travel_app/app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      required this.validator,
      this.readOnly = false});

  final TextEditingController textEditingController;
  final String hintText;
  final Function(String?) validator;
  bool readOnly = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: textEditingController,
      style: CustomTextStyle.textStyle500(
        color: CustomColors.text,
        fontSize: widgetSize(desktop: 16.sp, tablet: 17.sp, mobile: 18.sp),
      ),
      decoration: InputDecoration(
        border:
            readOnly ? InputBorder.none : StyleConstant.textFieldOutLineBorder,
        focusedBorder:
            readOnly ? InputBorder.none : StyleConstant.textFieldFocusedBorder,
        enabledBorder:
            readOnly ? InputBorder.none : StyleConstant.textFieldOutLineBorder,
        disabledBorder:
            readOnly ? InputBorder.none : StyleConstant.textFieldOutLineBorder,
        hintText: hintText,
        hintStyle: CustomTextStyle.textStyle500(
          color: CustomColors.text,
          fontSize: widgetSize(desktop: 16.sp, tablet: 17.sp, mobile: 18.sp),
        ),
      ),
      validator: (value) {
        validator(value);
        return null;
      }, // Validating name
    );
  }
}
