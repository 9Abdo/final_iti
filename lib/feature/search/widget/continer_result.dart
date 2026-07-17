import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/widgets/container_icon.dart';
import 'package:project_iti/core/widgets/image_widget.dart';

import 'package:project_iti/feature/models/search_model.dart';

class ContinerResult extends StatelessWidget {
  const ContinerResult({super.key, required this.searchModel});
  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: searchModel.image[0],
              ),
              Positioned(
                right: 5,
                top: 5,
                child: ContainerIcon(
                  color: Colors.white,
                  iconData: Icons.favorite_border_outlined,
                  iconColor: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(searchModel.title, style: AppStyle.textfield, maxLines: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${searchModel.price}\$",
                        maxLines: 1,
                        style: AppStyle.priceStyle,
                      ),
                    ),
                    ContainerIcon(
                      width: 24,
                      height: 24,
                      color: AppColor.primaycolor,
                      iconData: Icons.add,
                      iconColor: AppColor.whitecolor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
