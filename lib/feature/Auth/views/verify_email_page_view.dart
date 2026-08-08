import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/helper/showsnakbar.dart';
import 'package:project_iti/core/routing/route_const.dart';

class VerifyEmailPageView extends StatefulWidget {
  const VerifyEmailPageView({super.key, required this.email});
  final String email;


  @override
  State<VerifyEmailPageView> createState() => _VerifyEmailPageViewState();
}

class _VerifyEmailPageViewState extends State<VerifyEmailPageView> {
  Timer? timer;

  bool isLoading = false;
  bool canResend = true;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      await FirebaseAuth.instance.currentUser?.reload();

      final user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified) {
        timer?.cancel();

        setState(() {
          isLoading = true;
        });

        await Future.delayed(const Duration(seconds: 2));

        context.goNamed(RouteName.mainHomeName);
      }
    });
  }

  Future<void> resendEmail() async {
    if (!canResend) return;

    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();

      setState(() {
        canResend = false;
      });

      showSankBar(
        context,
        text: "Verification email sent successfully.",
        color: Colors.green,
      );
      Future.delayed(const Duration(seconds: 30), () {
        setState(() {
          canResend = true;
        });
      });
    } catch (e) {
      showSankBar(context, text: e.toString(), color: Colors.red);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   

    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Verify Email")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mark_email_read_rounded,
                size: 100.sp,
                color: AppColor.primaycolor,
              ),

              SizedBox(height: 30.h),

              Text(
                "Check your inbox",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 16.h),

              Text(
               widget.email,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.primaycolor,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                "We've sent a verification link to your email.\n\nAfter clicking the link you'll be redirected automatically.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),

              SizedBox(height: 35.h),

              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: canResend ? resendEmail : null,
                  child: Text(
                    canResend ? "Resend Email" : "Try again in 30 seconds",
                  ),
                ),
              ),
              SizedBox(height: 15.h),

              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: OutlinedButton(
                  onPressed: () {
                    context.goNamed(RouteName.signUpName);
                  },
                  child: const Text("Change Email"),
                ),
              ),

              SizedBox(height: 20.h),

              const Text(
                "Waiting for verification...",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
