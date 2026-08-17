import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/feature/orders/cubit/order_cubit.dart';


class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.id,
    required this.status,
    required this.date,
    required this.price, this.onTap,
  });

  final String id;
  final String status;
  final String date;
  final double price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: GestureDetector(
        onTap: onTap ,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: AppColor.primaycolor,
                  child: const Icon(Icons.shopping_basket, color: Colors.white),
                ),
        
                SizedBox(width: 12.w),
        
                // Order information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Order #$id",
                        style: AppStyle.textfield,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
        
                      SizedBox(height: 4.h),
        
                      Text(
                        status,
                        style: TextStyle(
                          color: status == "Delivered"
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
        
                      SizedBox(height: 4.h),
        
                      Text(
                        date,
                        style: const TextStyle(color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
        
                SizedBox(width: 32.w),
        
                Flexible(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await context.read<OrderCubit>().deleteOrder(id);
                        },
                        icon: Icon(Icons.delete_outlined, color: Colors.red),
                      ),
                      Text(
                        "${price.toStringAsFixed(2)} EGP",
                        style: AppStyle.priceStyle.copyWith(fontSize: 18.sp),
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
