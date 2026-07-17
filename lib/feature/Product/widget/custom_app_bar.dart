import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/widgets/container_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContainerIcon(
          onTap: () {
            context.pop();
          },
          width: 60.w,
          height: 60.h,
          color: Colors.grey[100]!,
          iconData: Icons.arrow_back,
          iconColor: Colors.black,
        ),
        SizedBox(width: 100.w),
        Text("Product", style: AppStyle.black24w600),
      ],
    );
  }
}
