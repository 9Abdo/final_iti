import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/routing/route_const.dart';
import 'package:project_iti/core/widgets/image_widget.dart';
import 'package:project_iti/feature/favourite/cubit/favourite_cubit.dart';
import 'package:project_iti/feature/models/home_model.dart';

class CardProdctFavourite extends StatelessWidget {
  const CardProdctFavourite({super.key, required this.homemodel});
  final Homemodel homemodel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.productDetailsName, extra: homemodel);
      },
      child: Card(
        borderOnForeground: true,
        child: Column(
          children: [
            Imagewidget(
              width: double.infinity,
              height: 134,
              image: homemodel.image,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (homemodel.clothesType.length > 9)
                        Text(
                          homemodel.clothesType.substring(0, 9),
                          style: AppStyle.textfield,
                        )
                      else
                        Text(homemodel.clothesType, style: AppStyle.textfield),
                      Text("${homemodel.price}\$", style: AppStyle.priceStyle),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      context.read<FavouriteCubit>().removeFromFavourite(
                        homemodel,
                      );
                    },
                    icon: Icon(Icons.favorite, color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
