import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/helper/dio_helper.dart';
import 'package:project_iti/core/routing/route_const.dart';
import 'package:project_iti/core/widgets/custom_text_field.dart';
import 'package:project_iti/feature/home/cubit/home_cubit.dart';
import 'package:project_iti/feature/home/cubit/home_state.dart';
import 'package:project_iti/feature/home/widgets/listtile_profile.dart';
import 'package:project_iti/feature/home/widgets/listview_container.dart';
import 'package:project_iti/feature/home/widgets/slider_view.dart';
import 'package:project_iti/feature/search/cubit/search_cubit.dart';
import 'package:project_iti/feature/search/cubit/search_state.dart';
import 'package:project_iti/feature/services/home_sevices.dart';
import 'package:project_iti/feature/services/search_services.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                HomeCubit(HomeServices(dio: DioHelper.dio!))
                  ..getAllProduct(),
          ),
          BlocProvider(
            create: (_) =>
                SearchCubit(SearchService(dio: DioHelper.dio!)),
          ),
        ],
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            if (state is SearchLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => Center(
                  child: Lottie.asset(
                    "assets/images/Search.json",
                    width: 180.w,
                  ),
                ),
              );
            }
             
            if (state is SearchSuccess) {
              Navigator.of(context).pop();

              context.pushNamed(
                RouteName.searchResultPath,
                extra: {
                  "products": state.products,
                  "query": context.read<SearchCubit>().lastQuery
                },
              );
            }

            if (state is SearchFailure) {
              Navigator.of(context).pop();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, searchState) {
            return Scaffold(
              body: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, homeState) {
                  if (homeState is HomeLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (homeState is HomeFailureState) {
                    return Center(
                      child: Text(homeState.error),
                    );
                  }

                  if (homeState is HomeSuccessState) {
                    return SingleChildScrollView(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ListtileProfile(),

                          SizedBox(height: 16.h),

                          CustomTextField(
                            hint: "Search here",
                            prefixicon: Icon(
                              Icons.search,
                              size: 28.sp,
                              color: Colors.blueGrey,
                            ),
                            onFieldSubmitted: (value) {
                              if (value.trim().isNotEmpty) {
                                context.read<SearchCubit>().search(value);
                              }
                            },
                          ),

                          SizedBox(height: 20.h),

                          const SliderView(),

                          SizedBox(height: 10.h),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Featured",
                                style: AppStyle.black24w600,
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.pushNamed(
                                    RouteName.productName,
                                    extra: homeState.product,
                                  );
                                },
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                    color: AppColor.primaycolor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),

                          ListviewContainer(
                            product: homeState.product,
                          ),

                          SizedBox(height: 20.h),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Most Popular",
                                style: AppStyle.black24w600,
                              ),
                              Text(
                                "See All",
                                style: TextStyle(
                                  color: AppColor.primaycolor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),

                          ListviewContainer(
                            product: homeState.product,
                          ),
                        ],
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}