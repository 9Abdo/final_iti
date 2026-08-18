import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowStatusDate extends StatelessWidget {
  const RowStatusDate({
    super.key,
    required this.orderStatus,
    required this.orderDate,
  });
  final String orderStatus;
  final String  orderDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: orderStatus == "Delivered"
                ? Colors.green.withValues(alpha: 0.15)
                : Colors.orange.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            orderStatus,
            style: TextStyle(
              color: orderStatus == "Delivered" ? Colors.green : Colors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const Spacer(),

        Text(
          (orderDate.toString()),
          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
        ),
      ],
    );
  }
}
