import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/widgets/container_icon.dart';
import 'package:project_iti/core/widgets/image_widget.dart';
import 'package:project_iti/feature/Product/widget/container_product.dart';
import 'package:project_iti/feature/Product/widget/custom_app_bar.dart';
import 'package:project_iti/feature/models/home_model.dart';

class Product extends StatelessWidget {
  const Product({super.key, required this.homemodel});
  final List<Homemodel> homemodel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: homemodel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 0.87,
                  ),
                  itemBuilder: (context, index) {
                    return ContainerProduct(homemodel: homemodel[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
