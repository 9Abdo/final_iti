import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';

import 'package:project_iti/feature/Account/views/account_view.dart';
import 'package:project_iti/feature/cart/views/cart_page_view.dart';
import 'package:project_iti/feature/favourite/views/favourite_page_view.dart';


import 'package:project_iti/feature/home/views/home_page_view.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePageView(),
    FavouritePageView(),
    CartPageView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: Colors.white,
              indicatorColor: AppColor.primaycolor.withOpacity(.15),

              iconTheme: WidgetStateProperty.resolveWith((states) {
                return IconThemeData(
                  color: states.contains(WidgetState.selected)
                      ? AppColor.primaycolor
                      : Colors.grey,
                  size: 26.sp,
                );
              }),

              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                return TextStyle(
                  color: states.contains(WidgetState.selected)
                      ? AppColor.primaycolor
                      : Colors.grey,
                  fontSize: 12.sp,
                  fontWeight: states.contains(WidgetState.selected)
                      ? FontWeight.bold
                      : FontWeight.w500,
                );
              }),
            ),
            child: NavigationBar(
              height: 75.h,
              selectedIndex: currentIndex,

              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

              onDestinationSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },

              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.home_outlined),
                  selectedIcon: const Icon(Icons.home),
                  label: "home".tr(),
                ),

                NavigationDestination(
                  icon: const Icon(Icons.favorite_outline),
                  selectedIcon: const Icon(Icons.favorite),
                  label: "Favourite",
                ),

                NavigationDestination(
                  icon: const Icon(Icons.shopping_bag_outlined),
                  selectedIcon: const Icon(Icons.shopping_bag),
                  label: "cart".tr(),
                ),

                NavigationDestination(
                  icon: const Icon(Icons.person_outline),
                  selectedIcon: const Icon(Icons.person),
                  label: "account".tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
