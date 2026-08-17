import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:project_iti/core/routing/route_const.dart';
import 'package:project_iti/feature/Auth/cubit/auth_cubit.dart';
import 'package:project_iti/feature/Auth/views/login_page_view.dart';
import 'package:project_iti/feature/Auth/views/sign_up_view.dart';
import 'package:project_iti/feature/Auth/views/verify_email_page_view.dart';
import 'package:project_iti/feature/Product/views/product.dart';
import 'package:project_iti/feature/home/views/main_home_pgae.dart';
import 'package:project_iti/feature/models/home_model.dart';
import 'package:project_iti/feature/models/order_model.dart';
import 'package:project_iti/feature/order_details/views/order_details_page_view.dart';
import 'package:project_iti/feature/orders/cubit/order_cubit.dart';
import 'package:project_iti/feature/orders/views/order_page_view.dart';
import 'package:project_iti/feature/product_details/views/product_details.dart';
import 'package:project_iti/feature/pymant/pymant_page_view.dart';
import 'package:project_iti/feature/search/search_result_view.dart';
import 'package:project_iti/feature/services/order_services.dart';

import 'package:project_iti/feature/splash/splash_view.dart';

GoRouter goRouter = GoRouter(
  initialLocation: RoutePath.splashscreen,
  routes: [
    GoRoute(
      path: RoutePath.loginPath,
      name: RouteName.loginName,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: LoginPageView(),
      ),
    ),
    GoRoute(
      path: RoutePath.signUpPath,
      name: RouteName.signUpName,
      builder: (context, state) => SignUpView(),
    ),
    GoRoute(
      path: RoutePath.verifyPath,
      name: RouteName.verifyName,
      builder: (context, state) {
        final email = state.extra as String;

        return VerifyEmailPageView(email: email);
      },
    ),
    GoRoute(
      path: RoutePath.mainHomePath,
      name: RouteName.mainHomeName,
      builder: (context, state) => MainHomeView(),
    ),

    GoRoute(
      path: RoutePath.productDetailsPath,
      name: RouteName.productDetailsName,
      builder: (context, state) {
        final Homemodel homemodel = state.extra as Homemodel;

        return ProductDetails(product: homemodel);
      },
    ),
    GoRoute(
      path: RoutePath.splashscreen,
      name: RouteName.splashscreen,
      builder: (context, state) => SplashView(),
    ),
    GoRoute(
      path: RoutePath.productPath,
      name: RouteName.productName,
      builder: (context, state) {
        final products = state.extra as List<Homemodel>;
        return Product(homemodel: products);
      },
    ),
    GoRoute(
      path: RoutePath.searchResultPath,
      name: RouteName.searchResultPath,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return SearchResultView(
          searchmodel: data["products"] as List<Homemodel>,
          query: data["query"] as String,
        );
      },
    ),
    GoRoute(
      path: RoutePath.pymantPath,
      name: RouteName.pymantName,
      builder: (context, state) {
        final amount = state.extra as double;
        return PaymentPageView(amount: amount);
      },
    ),
    GoRoute(
      path: RoutePath.orderPath,
      name: RouteName.orderName,
      builder: (context, state) {
        return OrderPageView();
      },
    ),
   GoRoute(
  path: RoutePath.orderdetailsPath,
  name: RouteName.orderdetailsName,
  builder: (context, state) {
    final order = state.extra as OrderModel;

    return BlocProvider(
      create: (_) => OrderCubit(OrderServices()),
      child: OrderDetailsPageView(
        order: order,
      ),
    );
  },
),
  ],
);
