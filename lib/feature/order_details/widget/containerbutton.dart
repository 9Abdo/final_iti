import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Containerbutton extends StatelessWidget {
  const Containerbutton({super.key, required this.orderStatus, required this.orderColor});
  final String orderStatus;
  final Color orderColor;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: orderColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          "Order $orderStatus",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
