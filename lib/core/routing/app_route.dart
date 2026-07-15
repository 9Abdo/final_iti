import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/routing/route_const.dart';
import 'package:project_iti/feature/Auth/cubit/auth_cubit.dart';
import 'package:project_iti/feature/Auth/views/login_page_view.dart';
import 'package:project_iti/feature/Auth/views/sign_up_view.dart';
import 'package:project_iti/feature/home/views/main_home_pgae.dart';

import 'package:project_iti/feature/splash/splash_view.dart';

GoRouter goRouter = GoRouter(
  initialLocation: RoutePath.loginPath,
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
      builder: (context, state) =>
          BlocProvider(create: (context) => AuthCubit(), child: SignUpView()),
    ),
    GoRoute(
      path: RoutePath.mainHomePath,
      name: RouteName.mainHomeName,
      builder: (context, state) => MainHomeView(),
    ),
    GoRoute(
      path: RoutePath.splashscreen,
      name: RouteName.splashscreen,
      builder: (context, state) => SplashView(),
    ),
  ],
);
