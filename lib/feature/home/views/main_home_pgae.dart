import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:project_iti/core/constant/app_color.dart';

import 'package:project_iti/feature/Account/views/account_view.dart';
import 'package:project_iti/feature/cart/views/cart_page_view.dart';
import 'package:project_iti/feature/chat/views/chatbotpageview.dart';
import 'package:project_iti/feature/favourite/views/favourite_page_view.dart';
import 'package:project_iti/feature/home/views/home_page_view.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  int currentIndex = 2;

  final List<Widget> pages = [
    FavouritePageView(),
    CartPageView(),
    HomePageView(),
    Chatbotpageview(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        child: CurvedNavigationBar(
          index: currentIndex,

          height: 80.h,

          backgroundColor: Colors.transparent,

          color: AppColor.primaycolor,
          maxWidth: double.infinity,

          buttonBackgroundColor: Colors.orange,

          animationDuration: const Duration(milliseconds: 500),

          animationCurve: Curves.easeInOut,

          items: [
            Icon(Icons.favorite_outline, size: 32.sp, color: Colors.white),

            Icon(Icons.shopping_bag_outlined, size: 32.sp, color: Colors.white),

            Icon(Icons.home, size: 32.sp, color: Colors.white),

            Icon(Icons.chat_bubble_outline, size: 32.sp, color: Colors.white),

            Icon(Icons.person_outline, size: 32.sp, color: Colors.white),
          ],

          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
