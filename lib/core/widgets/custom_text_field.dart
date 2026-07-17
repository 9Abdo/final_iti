import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.icon,
    this.validator,
    this.controller,
    this.prefixicon, this.onFieldSubmitted, this.onChanged,
  });
  final String hint;
  final bool obscureText;
  final IconButton? icon;
  final Widget? prefixicon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  

  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
       onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,

      decoration: InputDecoration(
        suffixIcon: icon,
        prefixIcon: prefixicon,
        fillColor: Colors.grey[200],
        filled: true,

        hint: Text(hint, style: AppStyle.subtitle),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(color: AppColor.borderfield),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(color: AppColor.borderfield),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
