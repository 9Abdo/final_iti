import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_iti/feature/favourite/cubit/favourite_state.dart';
import 'package:project_iti/feature/models/home_model.dart';
import 'package:project_iti/feature/services/favourite_services.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.favouriteServices) : super(NoFavouriteState()){
    getFavourite();
  }
  List<Homemodel> favcart = [];
  final FavouriteServices favouriteServices;
  StreamSubscription<List<Homemodel>>? subscription;
  getFavourite() async {
    subscription?.cancel();
    subscription = favouriteServices.getFavouriteServices().listen((products) {
      favcart..clear()..addAll(products);
      if (favcart.isEmpty) {
        emit(NoFavouriteState());
      } else {
        emit(FavouriteSuccessState(product: favcart));
      }

    });

  
      
  }

 Future<void> addToFavourite(Homemodel product)async {
    try {
      if (isProductInFavourite(product)) return;
      await favouriteServices.addFavouriteService(homemodel: product);
      
    } catch (e) {
      emit(FavouriteFailureState(error: e.toString()));
    }
  }

  Future<void> removeFromFavourite(Homemodel product)async {
    try {
      await favouriteServices.removeFavouriteService(homemodel: product);
    } catch (e) {
      emit(FavouriteFailureState(error: e.toString()));
    }
  }

  bool isProductInFavourite(Homemodel product) {
    return favcart.any((element) => element.id == product.id);
  }
  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
