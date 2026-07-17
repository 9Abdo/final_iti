import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:project_iti/core/helper/cach_helper.dart';
import 'package:project_iti/core/routing/route_const.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async {
      CachHelper.getToken().then((value) {
        if (value.isNotEmpty) {
          context.pushReplacementNamed(RouteName.mainHomeName);
        }
        else{
            context.pushReplacementNamed(RouteName.loginName);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/images/shopping cart.json")),
    );
  }
}
