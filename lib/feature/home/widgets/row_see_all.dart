import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';

class RowSeeAll extends StatelessWidget {
  const RowSeeAll({super.key, required this.text_1, this.onTap});
  final String text_1;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text_1, style: AppStyle.black24w600),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "See All",
            style: TextStyle(
              color: AppColor.primaycolor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
