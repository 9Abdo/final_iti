import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/feature/favourite/cubit/favourite_cubit.dart';
import 'package:project_iti/feature/favourite/cubit/favourite_state.dart';
import 'package:project_iti/feature/favourite/views/no_favourite.dart';
import 'package:project_iti/feature/favourite/widgets/card_prodct_favourite.dart';

class FavouritePageView extends StatelessWidget {
  const FavouritePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          if (state is NoFavouriteState) {
            return NoFavourite();
          }
          if (state is FavouriteFailureState) {
            return Text(state.error);
          }
          if (state is FavouriteSuccessState) {
            return Scaffold(
              backgroundColor: AppColor.whitecolor,
              appBar: AppBar(
                title: Text("Favourite", style: AppStyle.titleApp),
                centerTitle: true,
                backgroundColor: AppColor.whitecolor,
              ),
              body: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Expanded(
                      child: GridView.builder(
                        itemCount: state.product.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .93,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemBuilder: (context, index) {
                          return CardProdctFavourite(
                            homemodel: state.product[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
