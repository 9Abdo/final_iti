import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  final List<int> items = [0, 1, 2, 3, 4];
  final List<Color> color = [
    AppColor.primaycolor,
    Colors.deepOrangeAccent,
    Colors.teal,
    Colors.pink,
    Colors.orange,
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: items.map((i) {
            return Container(
              width: double.infinity,
              height: 135.h,
              decoration: BoxDecoration(
                color: color[i],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("winter_offer".tr(), style: AppStyle.buttonStyle),
                  Image.asset(
                    "assets/images/image 1.png",
                    width: 89.w,
                    height: 140.h,
                  ),
                ],
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 140.h,
            viewportFraction: 1,
            autoPlay: true,
            enlargeFactor: 5,

            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),

        const SizedBox(height: 16),

        DotsIndicator(
          dotsCount: items.length,
          position: currentPage.toDouble(),
          decorator: const DotsDecorator(
            color: Colors.grey,
            activeColor: AppColor.primaycolor,
            size: Size(8, 8),
            activeSize: Size(10, 10),
          ),
        ),
      ],
    );
  }
}
