import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/helper/cach_helper.dart';
import 'package:project_iti/core/routing/route_const.dart';

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
                    image: AssetImage("assets/images/Ellipse 1.png"),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: 16),
              Center(child: Text("Abdelrhman", style: AppStyle.black24w600)),
              SizedBox(height: 16.sp),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Profile", style: AppStyle.textfield),
                ),
              ),
              SizedBox(height: 8.sp),
              Card(
                child: ListTile(
                  leading: Icon(Icons.settings),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Setting", style: AppStyle.textfield),
                ),
              ),
              SizedBox(height: 8.sp),
              Card(
                child: ListTile(
                  leading: Icon(Icons.email),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Contact", style: AppStyle.textfield),
                ),
              ),
              SizedBox(height: 8.sp),
              Card(
                child: ListTile(
                  leading: Icon(Icons.share),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Share", style: AppStyle.textfield),
                ),
              ),
              SizedBox(height: 8.sp),
              Card(
                child: ListTile(
                  leading: Icon(Icons.help),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Help", style: AppStyle.textfield),
                ),
              ),
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

                    btnOkOnPress: () {
                      CachHelper.deleteToken();
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
