import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CashOnDelivery extends StatelessWidget {
  const CashOnDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.green.shade50,
          ),
          child: Row(
            children: [
              Icon(Icons.local_shipping_outlined, size: 30.sp),

              SizedBox(width: 12.w),

              Expanded(
                child: Text(
                  "You will pay when your order is delivered.",
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
