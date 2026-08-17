import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/feature/models/order_model.dart';
import 'package:project_iti/feature/order_details/widget/containerbutton.dart';
import 'package:project_iti/feature/order_details/widget/paymentmethod.dart';
import 'package:project_iti/feature/order_details/widget/price_row.dart';
import 'package:project_iti/feature/order_details/widget/product_item.dart';
import 'package:project_iti/feature/order_details/widget/row_status_date.dart';
import 'package:project_iti/feature/orders/cubit/order_cubit.dart';

class OrderDetailsPageView extends StatelessWidget {
  const OrderDetailsPageView({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details", style: AppStyle.titleApp),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order #${order.id}",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: 8.h),

            RowStatusDate(orderStatus: order.status, orderDate: order.date),

            SizedBox(height: 20.h),

            const Divider(),

            SizedBox(height: 15.h),

            Text(
              "Products",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12.h),

            ListView.builder(
              itemCount: order.products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final product = order.products[index];

                return ProductItem(product: product);
              },
            ),

            SizedBox(height: 10.h),

            const Divider(),

            SizedBox(height: 15.h),

            Text(
              "Payment Method",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12.h),

            Paymentmethod(paymentorder: order.paymentMethod),
            SizedBox(height: 20.h),

            const Divider(),

            SizedBox(height: 15.h),

            Text(
              "Price Details",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15.h),

            PriceRow(title: "Subtotal", price: order.subtotal),

            SizedBox(height: 10.h),

            PriceRow(title: "Delivery", price: order.delivery),

            SizedBox(height: 12.h),

            const Divider(),

            SizedBox(height: 12.h),

            PriceRow(title: "Total", price: order.total, isTotal: true),

            SizedBox(height: 25.h),

            // ================= ORDER STATUS =================
            if (order.status == "Pending") ...[
              GestureDetector(
                onTap: () async {
                  await context.read<OrderCubit>().updateOrderStatus(
                    id: order.id,
                    status: "Delivered",
                  );

                  if (!context.mounted) return;

                  Navigator.pop(context);
                },
                child: Containerbutton(
                  orderStatus: order.status,
                  orderColor: AppColor.primaycolor,
                ),
              ),
            ] else ...[
              Containerbutton(
                orderStatus: order.status,
                orderColor: Colors.green,
              ),
            ],
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
