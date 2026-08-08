import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:project_iti/core/routing/route_const.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      final user = FirebaseAuth.instance.currentUser;

     

      if (user != null) {
        await user.reload();

        final currentUser = FirebaseAuth.instance.currentUser;

        if (currentUser != null && currentUser.emailVerified) {
          context.goNamed(RouteName.mainHomeName);
        } else {
          context.goNamed(RouteName.verifyName);
        }
      } else {
        context.goNamed(RouteName.loginName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/images/shopping cart.json"),
      ),
    );
  }
}