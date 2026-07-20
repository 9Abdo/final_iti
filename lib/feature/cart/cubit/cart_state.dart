import 'package:project_iti/feature/models/home_model.dart';

abstract class CartState {}

class InitStateCart extends CartState {}

class CartLoadingState extends CartState {
  final int productId;
  CartLoadingState(this.productId);
}

class NoCartPageState extends CartState {}

class CartPageSuccessState extends CartState {
  final List<Homemodel> product;

  CartPageSuccessState({required this.product});
}

class FailureCartState extends CartState {
  final String error;

  FailureCartState({required this.error});
}
