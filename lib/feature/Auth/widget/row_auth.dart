
import 'package:flutter/material.dart';
import 'package:project_iti/core/constant/app_style.dart';

class RowAuth extends StatelessWidget {
  const RowAuth({super.key, required this.text, required this.textButton, this.onTap});
  final String text;
  final String textButton;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppStyle.subtitle),
        GestureDetector(onTap: onTap,
          child: Text(textButton, style: AppStyle.textfield),),
      ],
    );
  }
}
