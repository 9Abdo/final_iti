import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerIconAdd extends StatelessWidget {
  const ContainerIconAdd({super.key, required this.icon, required this.onTap});
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.r),
          border: Border.all(width: 1.w),
        ),
        child: Center(child: Icon(icon, size: 16.sp)),
      ),
    );
  }
}
