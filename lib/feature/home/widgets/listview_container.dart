import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/feature/home/widgets/container_cart.dart';
import 'package:project_iti/feature/models/home_model.dart';

class ListviewContainer extends StatelessWidget {
  const ListviewContainer({super.key, required this.product});
  final List<Homemodel> product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        separatorBuilder: (_, __) => SizedBox(width: 15.w),
        itemBuilder: (context, index) {
          return ContainerCart(homemodel: product[index]);
        },
      ),
    );
  }
}
