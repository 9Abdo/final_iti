import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_iti/core/widgets/custom_text_field.dart';

class VodfoneCashWidget extends StatelessWidget {
  const VodfoneCashWidget({super.key, required this.phoneController, });
  final TextEditingController phoneController;
 
 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.w),
        Text(
          "Vodafone Cash Number",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8.w),
        CustomTextField(
          hint: '010xxxxxxxx',
          controller: phoneController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 16.w),
       
      ],
    );
  }
}
