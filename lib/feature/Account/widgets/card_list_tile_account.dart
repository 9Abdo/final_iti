import 'package:flutter/material.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';

class CardListTileAccount extends StatelessWidget {
  const CardListTileAccount({
    super.key,
    required this.iconData,
    required this.title,
    this.onTap,
  });
  final IconData iconData;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(iconData, color: AppColor.primaycolor),
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(title, style: AppStyle.textfield),
      ),
    );
  }
}
