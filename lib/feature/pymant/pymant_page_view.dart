
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/helper/showsnakbar.dart';
import 'package:project_iti/core/widgets/custom_button.dart';
import 'package:project_iti/feature/models/order_model.dart';
import 'package:project_iti/feature/pymant/widget/cash_on_delivery.dart';
import 'package:project_iti/feature/pymant/widget/pymant_option.dart';
import 'package:project_iti/feature/pymant/widget/row_pyamnt.dart';
import 'package:project_iti/feature/pymant/widget/show_dialgo_pymant.dart';
import 'package:project_iti/feature/pymant/widget/visa_card_widget.dart';
import 'package:project_iti/feature/pymant/widget/vodfone_cash_widget.dart';
import 'package:project_iti/feature/services/cart_services.dart';
import 'package:project_iti/feature/services/order_services.dart';

class PaymentPageView extends StatefulWidget {
  const PaymentPageView({super.key, required this.amount});

  final double amount;

  @override
  State<PaymentPageView> createState() => _PaymentPageViewState();
}

class _PaymentPageViewState extends State<PaymentPageView> {
  String selectedMethod = "Vodafone Cash";

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cardController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  Future<void> processPayment() async {
    if (selectedMethod == "Vodafone Cash") {
      if (phoneController.text.trim().isEmpty) {
        showSankBar(
          context,
          text: "Please enter your Vodafone Cash number",
          color: Colors.red,
        );
        return;
      }

      if (phoneController.text.trim().length != 11) {
        showSankBar(
          context,
          text: "Please enter a valid phone number",
          color: Colors.red,
        );
        return;
      }
    }

    if (selectedMethod == "Visa / Mastercard") {
      if (cardController.text.trim().isEmpty ||
          expiryController.text.trim().isEmpty ||
          cvvController.text.trim().isEmpty) {
        showSankBar(
          context,
          text: "Please complete your card information",
          color: Colors.red,
        );
        return;
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    await Future.delayed(const Duration(seconds: 2));
    final cartProducts = await CartServices().getCartProductsOnce();

    final order = OrderModel(
  id: "",
  userId: FirebaseAuth.instance.currentUser!.uid,
  status: "Pending",
  date: DateTime.now(),
  subtotal: widget.amount,
  delivery: 50,
  total: widget.amount + 50,
  paymentMethod: selectedMethod,
  products: cartProducts,
);

    await OrderServices().addOrder(order: order.toJson());

    await CartServices().clearCart();
    if (!mounted) return;

    Navigator.pop(context);
    showdialgopayment(amount: widget.amount, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment"), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: RadioGroup(
              groupValue: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value!;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Mathod",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PymantOption(
                    valueCard: "Visa / Mastercard",
                    titleoption: "Visa / Mastercard",
                    imageoption: "assets/images/vissa.png",
                  ),
                  PymantOption(
                    valueCard: "Vodafone Cash",
                    titleoption: "Vodafone Cash",
                    imageoption: "assets/images/vodfonecash.webp",
                  ),
                  PymantOption(
                    valueCard: "Cash On Delivery",
                    titleoption: "Cash On Delivery",
                    imageoption: "assets/images/cash_on_delivery.jfif",
                  ),
                  if (selectedMethod == "Vodafone Cash")
                    VodfoneCashWidget(phoneController: phoneController),
                  if (selectedMethod == "Visa / Mastercard")
                    VisaCardWidget(
                      cardController: cardController,
                      expiryController: expiryController,
                      cvvController: cvvController,
                    ),
                  if (selectedMethod == "Cash On Delivery") CashOnDelivery(),
                  SizedBox(height: 30.h),
                  RowPyamnt(amount: widget.amount),
                  SizedBox(height: 20.h),
                  Custombutton(
                    buttonName: "Pay Now",
                    onPressed: processPayment,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
