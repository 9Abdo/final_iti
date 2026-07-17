import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoCartPageView extends StatelessWidget {
  const NoCartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(child:Lottie.asset("assets/images/Empty_cart.json",)),
    ));
  }
}