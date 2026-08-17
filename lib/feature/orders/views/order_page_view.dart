import 'package:flutter/material.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/feature/orders/views/complete_page_view.dart';
import 'package:project_iti/feature/orders/views/pending_page_view.dart';

class OrderPageView extends StatelessWidget {
  const OrderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Orders", style: AppStyle.titleApp),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.orange,
            indicatorWeight: 5,
            labelColor: AppColor.primaycolor,
            labelStyle: AppStyle.textfield,
            tabs: [
              Tab(text: "Pending"),
              Tab(text: "Completed"),
            ],
          ),
        ),
        body: TabBarView(children: [PendingPageView(), CompletedPageView()]),
      ),
    );
  }
}
