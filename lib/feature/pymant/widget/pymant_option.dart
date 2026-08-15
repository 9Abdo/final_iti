import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PymantOption extends StatelessWidget {
  const PymantOption({
    super.key,
    required this.valueCard,
    required this.titleoption,
    required this.imageoption,
  });
  final String valueCard;
  final String titleoption;
  final String imageoption;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: RadioListTile(
        value: valueCard,
        title: Text(titleoption),
        secondary: Image.asset(
          imageoption,
          width: 80.w,
          height: 80.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
