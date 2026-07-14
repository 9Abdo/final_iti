import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_style.dart';

class ListtileProfile extends StatelessWidget {
  const ListtileProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/images/Ellipse 1.png"),
          ),
        ),
      ),
      title: Text("Hello!", style: AppStyle.subtitle),
      subtitle: Text("John William", style: AppStyle.textfield),
      trailing: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.notifications, size: 24.sp, color: Colors.blueGrey),
      ),
    );
  }
}
