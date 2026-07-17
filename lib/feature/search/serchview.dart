import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/routing/route_const.dart';

import 'package:project_iti/core/widgets/custom_text_field.dart';
import 'package:project_iti/feature/search/cubit/search_cubit.dart';
import 'package:project_iti/feature/search/cubit/search_state.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: "Search",
                      prefixicon: const Icon(Icons.search),
                      onFieldSubmitted: (value) async {
                        await context.read<SearchCubit>().search(value);

                        final state = context.read<SearchCubit>().state;

                        if (state is SearchSuccess) {
                            log("Navigate");
                          context.pushNamed(
                            RouteName.searchResultPath,
                            extra: state.products,
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Text("Cancle", style: AppStyle.priceStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
