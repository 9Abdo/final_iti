import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 60,
  });
  final String buttonName;
  final void Function() onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width!,
      height: height?.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaycolor),
        child: Text(buttonName, style: AppStyle.buttonStyle),
      ),
    );
  }
}
