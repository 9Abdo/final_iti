import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';

import 'package:project_iti/core/routing/route_const.dart';
import 'package:project_iti/feature/Account/widgets/card_list_tile_account.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(height: 40.h),
              Container(
                width: 99,
                height: 99,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/images/p.jpg"),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: 16),
              Center(child: Text("Abdelrhman", style: AppStyle.black24w600)),
              SizedBox(height: 16.sp),
              CardListTileAccount(iconData: Icons.person, title: "Profile"),
              SizedBox(height: 8.sp),
              CardListTileAccount(
                iconData: Icons.inventory_2,
                title: "Orders",
                onTap: () {
                  context.pushNamed(RouteName.orderName);
                },
              ),
              SizedBox(height: 8.sp),
              CardListTileAccount(iconData: Icons.email, title: "Contact"),
              SizedBox(height: 8.sp),
              CardListTileAccount(iconData: Icons.share, title: "Share"),
              SizedBox(height: 8.sp),
              CardListTileAccount(iconData: Icons.help, title: "Help"),
              SizedBox(height: 8.sp),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.scale,
                    title: "Log ou",
                    desc: "Are you sure you want to log out?",
                    btnCancelText: "cancel",
                    btnCancelColor: Colors.grey,
                    btnCancelOnPress: () {},
                    btnOkText: "Log out",
                    btnOkColor: Colors.red,

                    btnOkOnPress: () async {
                      await FirebaseAuth.instance.signOut();
                      context.goNamed(RouteName.loginName);
                    },
                  ).show();
                },
                child: Text(
                  "Sign out",
                  style: TextStyle(fontSize: 20.sp, color: AppColor.whitecolor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
