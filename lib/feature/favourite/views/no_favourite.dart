import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoFavourite extends StatelessWidget {
  const NoFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/images/Love.json",
          height: 160.h,
          width: 160.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
