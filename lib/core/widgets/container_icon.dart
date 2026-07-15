import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({
    super.key,
    required this.color,
    required this.iconData,
    this.onTap,
    required this.iconColor,  this.width=48,this.height=48,
  });
  final Color color;
  final IconData iconData;
  final void Function()? onTap;
  final Color iconColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:width.w,
        height:height.h,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(child: Icon(iconData, color: iconColor)),
      ),
    );
  }
}
