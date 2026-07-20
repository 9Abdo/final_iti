import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/widgets/custom_button.dart';
import 'package:project_iti/feature/cart/cubit/cart_cubit.dart';
import 'package:project_iti/feature/cart/cubit/cart_state.dart';
import 'package:project_iti/feature/cart/views/no_cart_page_view.dart';
import 'package:project_iti/feature/cart/widget/product_buy.dart';
import 'package:project_iti/feature/cart/widget/row_price.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is NoCartPageState) {
          return NoCartPageView();
        }
        if (state is FailureCartState) {
          return Text(state.error);
        }
        if (state is CartPageSuccessState) {
          final cartCubit = context.read<CartCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text("My Cart", style: AppStyle.titleApp),
              centerTitle: true,
              scrolledUnderElevation: 0,
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.all(24.sp),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.product.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(4.sp),
                          child: ProductBuy(homemodel: state.product[index]),
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
                            text: "Sub Total",
                            price: "${cartCubit.subTotal} \$",
                          ),

                          SizedBox(height: 16.h),

                          RowPrice(
                            text: "Discount",
                            price: "${cartCubit.discountAmount} \$",
                          ),

                          SizedBox(height: 16.h),

                          RowPrice(
                            text: "Items",
                            price: state.product.length.toString(),
                          ),

                          SizedBox(height: 16.h),

                          const Divider(),

                          SizedBox(height: 16.h),

                          Row(
                            children: [
                              Text("Total", style: AppStyle.textfield),
                              const Spacer(),
                              Text(
                                "${cartCubit.total} \$",
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
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
