import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/widgets/custom_button.dart';
import 'package:project_iti/feature/cart/widget/product_buy.dart';
import 'package:project_iti/feature/cart/widget/row_price.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart", style: AppStyle.titleApp),
          centerTitle: true,
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        body: 

            

             Padding(
                padding: EdgeInsets.all(24.sp),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(4.sp),
                            child: ProductBuy(),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.grey[100],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Column(
                          children: [
                            RowPrice(
                              text: "sub_total",
                              price: "130"
                            ),

                            SizedBox(height: 16.h),

                            RowPrice(
                              text: "discount",
                              price:"50"
                            ),

                            SizedBox(height: 16.h),

                            RowPrice(
                              text: "items",
                              price: "4"
                            ),

                            SizedBox(height: 16.h),

                            const Divider(),

                            SizedBox(height: 16.h),

                            Row(
                              children: [
                                Text("total", style: AppStyle.textfield),
                                const Spacer(),
                                Text(
                                  "1450",
                                  style: AppStyle.textfield,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Custombutton(buttonName: "checkout", onPressed: () {}),
                  ],
                ),
              ));
            }

           
          }


