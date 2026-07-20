import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/widgets/image_widget.dart';
import 'package:project_iti/feature/cart/cubit/cart_cubit.dart';
import 'package:project_iti/feature/cart/widget/container_icon.dart';
import 'package:project_iti/feature/models/home_model.dart';

class ProductBuy extends StatefulWidget {
  const ProductBuy({super.key, required this.homemodel});
  final Homemodel homemodel;

  @override
  State<ProductBuy> createState() => _ProductBuyState();
}

class _ProductBuyState extends State<ProductBuy> {
  
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
            Imagewidget(
              width: 83.w,
              height: 79.h,
              image: widget.homemodel.image,
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.homemodel.clothesType.length > 9)
                  Text(
                    widget.homemodel.clothesType.substring(0, 9),
                    style: AppStyle.textfield,
                  )
                else
                  Text(widget.homemodel.clothesType, style: AppStyle.textfield),
                Spacer(),
                Text("\$${widget.homemodel.price}", style: AppStyle.textfield),
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CartCubit>().removeToCart(widget.homemodel);
                  },
                  icon: Icon(Icons.delete_outline, color: Colors.red),
                ),
                Spacer(),

                Row(
                  children: [
                    ContainerIconAdd(
                      icon: Icons.remove,
                      onTap: () {
                        context.read<CartCubit>().decrementQuantity(
                          widget.homemodel,
                        );
                      },
                    ),
                    SizedBox(width: 8.w),
                    Text("${widget.homemodel.quantity}"),
                    SizedBox(width: 8.w),
                    ContainerIconAdd(
                      icon: Icons.add,
                      onTap: () {
                        context.read<CartCubit>().incrementQuantity(
                          widget.homemodel,
                        );
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
