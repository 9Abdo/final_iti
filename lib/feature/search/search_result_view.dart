import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/feature/Product/widget/container_product.dart';
import 'package:project_iti/feature/models/home_model.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({
    super.key,
    required this.searchmodel,
    required this.query,
  });
  final List<Homemodel> searchmodel;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Text("Result for ", style: AppStyle.subtitle),
                Text(
                  '"$query"',
                  style: AppStyle.priceStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Spacer(),
                Text(
                  "${searchmodel.length} Results Found",
                  style: AppStyle.priceStyle,
                ),
              ],
            ),
            SizedBox(height: 16.h),

            Expanded(
              child: GridView.builder(
                itemCount: searchmodel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.87,
                ),
                itemBuilder: (context, index) {
                  return ContainerProduct(homemodel: searchmodel[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
