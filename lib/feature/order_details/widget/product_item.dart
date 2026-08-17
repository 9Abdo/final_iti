import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/widgets/image_widget.dart';
import 'package:project_iti/feature/models/home_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, });
  final Homemodel product;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // Product Image
         Imagewidget(width: 75.w, height: 75.h, image:product.image),
          SizedBox(width: 12.w),

          // Product Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.clothesType,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 7.h),

                Text(
                  "Quantity: ${product.quantity}",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          Text(
            "${product.price.toStringAsFixed(2)} EGP",
            style: AppStyle.priceStyle.copyWith(fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}