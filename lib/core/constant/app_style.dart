
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';

class AppStyle {
  static TextStyle titleApp = TextStyle(
    color: AppColor.secondColor,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subtitle = TextStyle(
    color: AppColor.subTitleColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textfield = TextStyle(
    color: AppColor.secondColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonStyle = TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle selecttext = TextStyle(
    color: AppColor.whitecolor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle priceStyle = TextStyle(
    color: AppColor.subTitleColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle black24w600 = TextStyle(
    color: AppColor.secondColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );
}
