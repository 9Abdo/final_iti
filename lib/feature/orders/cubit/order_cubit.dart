import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_iti/feature/models/order_model.dart';
import 'package:project_iti/feature/orders/cubit/order_state.dart';
import 'package:project_iti/feature/services/order_services.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderServices) : super(OrderInitial());

  final OrderServices orderServices;

StreamSubscription<List<OrderModel>>? _subscription;

void listenOrders(String userId) {
  _subscription?.cancel();

  _subscription = orderServices.getOrders(userId).listen((orders) {
    if (!isClosed) {
      emit(OrderSuccess(orders:orders));
    }
  });
}

  Future<void> addOrder({
    required Map<String, dynamic> order,
  }) async {
    try {
      emit(OrderLoading());

      await orderServices.addOrder(order: order);
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
  Future<void> deleteOrder(String id) async {
  try {
    await orderServices.removeOrder(id: id);
  } catch (e) {
    if (!isClosed) {
      emit(OrderError(e.toString()));
    }
  }
}
Future <void> updateOrderStatus({
  required String id,
  required String status,
}) async{
  try {
    await orderServices.updateOrderStatus(id: id, status: status);
  } catch (e) {
    if (!isClosed) {
      emit(OrderError(e.toString()));
    }
  }
}

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}