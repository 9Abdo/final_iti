import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showdialgopayment(BuildContext context, {required double amount}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title: Lottie.asset("assets/images/Success Animation Var 1.json"),
        content: Text(
          "Your payment of ${amount.toStringAsFixed(2)} EGP was completed successfully.",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Continue"),
            ),
          ),
        ],
      );
    },
  );
}
