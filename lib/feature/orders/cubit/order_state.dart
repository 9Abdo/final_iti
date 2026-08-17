import 'package:project_iti/feature/models/order_model.dart';

class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final List<OrderModel> orders;

  OrderSuccess({required this.orders});
}

class OrderError extends OrderState {
  final String message;

  OrderError(this.message);
}
