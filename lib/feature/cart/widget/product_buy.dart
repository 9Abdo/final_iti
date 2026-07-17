import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/feature/cart/widget/container_icon.dart';

class ProductBuy extends StatefulWidget {
  const ProductBuy({super.key,});


  @override
  State<ProductBuy> createState() => _ProductBuyState();
}

class _ProductBuyState extends State<ProductBuy> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 107.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColor.subTitleColor),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Row(
          children: [
          //  Imagewidget(
          //    width: 83.w,
          //    height: 79.h,
          //    image: widget.cartModal.thumbnail,
          //  ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                  Text(
                    "shoose",
                    style: AppStyle.textfield,
                  )
                ,
                Spacer(),
                Text("\$", style: AppStyle.textfield),
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete_outline, color: Colors.red),
                ),
                Spacer(),

                Row(
                  children: [
                    ContainerIconAdd(
                      icon: Icons.remove,
                      onTap: () {
                        setState(() {
                          counter--;
                        });
                      },
                    ),
                    SizedBox(width: 8.w),
                    Text("4"),
                    SizedBox(width: 8.w),
                    ContainerIconAdd(
                      icon: Icons.add,
                      onTap: () {
                        setState(() {
                          counter++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
