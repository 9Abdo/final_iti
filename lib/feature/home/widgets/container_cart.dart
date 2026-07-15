import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/routing/route_const.dart';
import 'package:project_iti/core/widgets/image_widget.dart';
import 'package:project_iti/feature/models/home_model.dart';

class ContainerCart extends StatelessWidget {
  const ContainerCart({super.key, required this.homemodel});
  final Homemodel homemodel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteName.productDetailsName,
          extra: homemodel,
        );
      },
      child: Container(
        width: 126.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Imagewidget(
                  width: 126.w,
                  height: 120.h,
                  image: homemodel.image,
                ),

                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.favorite_border, size: 20.sp),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homemodel.clothesType,
                    style: AppStyle.textfield,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${homemodel.price}\$",
                    style: AppStyle.priceStyle
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
