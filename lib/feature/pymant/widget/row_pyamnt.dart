import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_style.dart';

class RowPyamnt extends StatelessWidget {
  const RowPyamnt({super.key, required this.amount});
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total Amount",
          style: AppStyle.black24w600.copyWith(fontSize: 20.sp),
        ),
        Text(
          "${amount.toStringAsFixed(2)} EGP",
          style: AppStyle.black24w600.copyWith(fontSize: 20.sp),
        ),
      ],
    );
  }
}
