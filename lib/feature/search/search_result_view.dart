import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_style.dart';

import 'package:project_iti/feature/models/search_model.dart';
import 'package:project_iti/feature/search/widget/continer_result.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key, required this.searchmodel});
  final List<SearchModel> searchmodel;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Result for", style: AppStyle.subtitle),
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
                  return ContinerResult(searchModel: searchmodel[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
