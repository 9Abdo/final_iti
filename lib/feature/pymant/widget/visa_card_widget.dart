import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/widgets/custom_text_field.dart';

class VisaCardWidget extends StatelessWidget {
  const VisaCardWidget({
    super.key,
    required this.cardController,
    required this.expiryController,
    required this.cvvController,
  });
  final TextEditingController cardController;
  final TextEditingController expiryController;
  final TextEditingController cvvController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          "Card Number",
          style: AppStyle.textfield.copyWith(fontSize: 18.sp),
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          hint: "1234 5678 9012 3456",
          controller: cardController,
          maxLength: 16,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hint: "MM/YY",
                controller: expiryController,
                maxLength: 5,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: CustomTextField(
                hint: "123",
                controller: cvvController,
                maxLength: 3,
                obscureText: true,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
