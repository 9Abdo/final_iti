import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/helper/showsnakbar.dart';
import 'package:project_iti/core/widgets/container_icon.dart';
import 'package:project_iti/core/widgets/custom_button.dart';
import 'package:project_iti/core/widgets/image_widget.dart';
import 'package:project_iti/feature/cart/cubit/cart_cubit.dart';
import 'package:project_iti/feature/cart/cubit/cart_state.dart';
import 'package:project_iti/feature/favourite/cubit/favourite_cubit.dart';
import 'package:project_iti/feature/favourite/cubit/favourite_state.dart';
import 'package:project_iti/feature/models/home_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final Homemodel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Imagewidget(
                          width: double.infinity,
                          height: 401.h,
                          image: product.image,
                          radius: 30.r,
                        ),
                        Positioned(
                          top: 40,
                          left: 14,
                          child: ContainerIcon(
                            color: AppColor.containericon,
                            iconData: Icons.arrow_back,
                            iconColor: Colors.black,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 14,
                          child: BlocBuilder<FavouriteCubit, FavouriteState>(
                            builder: (context, state) {
                              final favouriteCubit = context
                                  .read<FavouriteCubit>();

                              final isFavourite = favouriteCubit
                                  .isProductInFavourite(product);

                              return ContainerIcon(
                                color: AppColor.containericon,
                                iconData: isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                iconColor: isFavourite
                                    ? Colors.red
                                    : Colors.black,
                                onTap: () {
                                  if (isFavourite) {
                                    favouriteCubit.removeFromFavourite(product);
                                  } else {
                                    favouriteCubit.addToFavourite(product);
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.clothesType,
                              style: AppStyle.black24w600,
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            "${product.price}\$",
                            style: AppStyle.priceStyle.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Text(
                        product.description,
                        style: AppStyle.subtitle,
                      ),
                    ),
                    SizedBox(height: 200.h),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(color: Colors.white),
                  child: SafeArea(
                    top: false,
                    child: Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<CartCubit, CartState>(
                            builder: (context, state) {
                              final cartCubit = context.read<CartCubit>();
                              final isProductInCart = cartCubit.isProductInCart(
                                product,
                              );
                              if (state is CartLoadingState &&
                                  state.productId == product.id) {
                                return SizedBox(
                                  height: 60.h,
                                  child: Center(
                                    child: Lottie.asset(
                                      "assets/images/Add_To_Cart_Success.json",
                                      width: 70.w,
                                      height: 70.h,
                                    ),
                                  ),
                                );
                              }
                              return Custombutton(
                                buttonName: isProductInCart
                                    ? "Added to Cart"
                                    : "Buy Now",

                                onPressed: isProductInCart
                                    ? null
                                    : () async {
                                        cartCubit.addToCart(product);
                                        await Future.delayed(
                                          Duration(seconds: 2),
                                        );
                                        showSankBar(
                                          context,
                                          text: "Product added to cart",
                                          color: Colors.green,
                                        );
                                      },
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          width: 56.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: const Icon(Icons.lock),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
