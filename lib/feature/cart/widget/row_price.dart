import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_style.dart';

class RowPrice extends StatelessWidget {
  const RowPrice({super.key, required this.text, required this.price});
  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppStyle.priceStyle.copyWith(fontSize: 16.sp)),
        Spacer(),
        Text(price, style: AppStyle.textfield),
      ],
    );
  }
}
