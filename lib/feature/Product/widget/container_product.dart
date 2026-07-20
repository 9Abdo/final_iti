import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/helper/showsnakbar.dart';
import 'package:project_iti/core/routing/route_const.dart';
import 'package:project_iti/core/widgets/container_icon.dart';
import 'package:project_iti/core/widgets/image_widget.dart';
import 'package:project_iti/feature/cart/cubit/cart_cubit.dart';
import 'package:project_iti/feature/cart/cubit/cart_state.dart';
import 'package:project_iti/feature/favourite/cubit/favourite_cubit.dart';
import 'package:project_iti/feature/favourite/cubit/favourite_state.dart';
import 'package:project_iti/feature/models/home_model.dart';

class ContainerProduct extends StatelessWidget {
  const ContainerProduct({super.key, required this.homemodel});
  final Homemodel homemodel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.productDetailsName, extra: homemodel);
      },
      child: Container(
        width: 155.w,
        height: 200.h,
        decoration: BoxDecoration(
          color: Color(0xffF8F7F7),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Imagewidget(
                  width: double.infinity,
                  height: 144.h,
                  image: homemodel.image,
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: BlocBuilder<FavouriteCubit, FavouriteState>(
                    builder: (context, state) {
                      final favouritecart = context.read<FavouriteCubit>();
                      final isfavourite = favouritecart.isProductInFavourite(
                        homemodel,
                      );

                      return GestureDetector(
                        onTap: () {
                          if (isfavourite) {
                            favouritecart.removeFromFavourite(homemodel);
                          } else {
                            favouritecart.addToFavourite(homemodel);
                          }
                        },
                        child: ContainerIcon(
                          color: Colors.white,
                          iconData: isfavourite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          iconColor: isfavourite ? Colors.red : Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homemodel.clothesType,
                  style: AppStyle.textfield,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${homemodel.price}\$",
                        maxLines: 1,
                        style: AppStyle.priceStyle,
                      ),
                    ),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        final cartCubit = context.read<CartCubit>();
                        final isProductInCart = cartCubit.isProductInCart(
                          homemodel,
                        );
                        if (state is CartLoadingState &&
                            state.productId == homemodel.id) {
                          return SizedBox(
                            height: 50.h,
                            child: Center(
                              child: Lottie.asset(
                                "assets/images/Add_To_Cart_Success.json",
                                width: 58.w,
                                height: 58.h,
                              ),
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: isProductInCart
                              ? null
                              : () async {
                                  cartCubit.addToCart(homemodel);
                                  await Future.delayed(
                                    const Duration(seconds: 1),
                                  );
                                  showSankBar(
                                    context,
                                    text: "Product added to cart",
                                    color: Colors.green,
                                  );
                                },
                          child: ContainerIcon(
                            width: 24,
                            height: 24,
                            color: isProductInCart
                                ? Colors.grey
                                : AppColor.primaycolor,
                            iconData: isProductInCart ? Icons.check : Icons.add,
                            iconColor: AppColor.whitecolor,
                          ),
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
