import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_iti/core/helper/const.dart';
import 'package:project_iti/feature/cart/cubit/cart_state.dart';
import 'package:project_iti/feature/models/home_model.dart';
import 'package:project_iti/feature/services/cart_services.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.service) : super(NoCartPageState()) {
    listenCart();
  }

  final CartServices service;

  final List<Homemodel> cartProducts = [];

  StreamSubscription<List<Homemodel>>? _subscription;

  void listenCart() {
    _subscription?.cancel();

    _subscription = service.getCartProducts().listen((products) {
      cartProducts
        ..clear()
        ..addAll(products);

      if (cartProducts.isEmpty) {
        emit(NoCartPageState());
      } else {
        emit(CartPageSuccessState(
          product: List.from(cartProducts),
        ));
      }
    });
  }

  Future<void> addToCart(Homemodel product) async {
    try {
      if (isProductInCart(product)) return;

      emit(CartLoadingState(product.id));

      await Future.delayed(const Duration(seconds: 2));

      await service.addtoCart(homemodel: product);
         log("Added Successfully");
    } catch (e) {
      emit(FailureCartState(error: e.toString()));
    }
  }

  Future<void> removeToCart(Homemodel product) async {
    try {
      await service.removefromCart(homemodel: product);
    } catch (e) {
      emit(FailureCartState(error: e.toString()));
    }
  }

  bool isProductInCart(Homemodel product) {
    return cartProducts.any((element) => element.id == product.id);
  }

  Future<void> incrementQuantity(Homemodel product) async {
    try {
      product.quantity++;

      await service.updateQuantity(homemodel: product);
    } catch (e) {
      emit(FailureCartState(error: e.toString()));
    }
  }

  Future<void> decrementQuantity(Homemodel product) async {
    try {
      if (product.quantity > 1) {
        product.quantity--;

        await service.updateQuantity(homemodel: product);
      }
    } catch (e) {
      emit(FailureCartState(error: e.toString()));
    }
  }

  double get subTotal {
    return cartProducts.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  double get discountAmount {
    return subTotal * discount;
  }

  double get total {
    return subTotal - discountAmount;
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}