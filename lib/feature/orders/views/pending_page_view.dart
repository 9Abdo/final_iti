import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/routing/route_const.dart';
import 'package:project_iti/feature/orders/cubit/order_cubit.dart';
import 'package:project_iti/feature/orders/cubit/order_state.dart';
import 'package:project_iti/feature/orders/views/no_order_page.dart';
import 'package:project_iti/feature/orders/widget/orderitem.dart';
import 'package:project_iti/feature/services/order_services.dart';

class PendingPageView extends StatelessWidget {
  const PendingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return BlocProvider(
      create: (context) => OrderCubit(OrderServices())..listenOrders(userId),

      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          // Loading
          if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error
          if (state is OrderError) {
            return Center(child: Text(state.message));
          }

          if (state is OrderSuccess) {
            final pendingOrders = state.orders
                .where((order) => order.status == "Pending")
                .toList();

            if (pendingOrders.isEmpty) {
              return NoOrderPage();
            }

            return Column(
              children: [
                SizedBox(height: 10.h),

                Expanded(
                  child: ListView.builder(
                    itemCount: pendingOrders.length,
                    itemBuilder: (context, index) {
                      final order = pendingOrders[index];

                      final timestamp = order.date;

                      return OrderItem(
                        id: order.id.toString(),
                        status: order.status.toString(),
                        date: timestamp.toString(),
                        price: (order.total as num).toDouble(),
                        onTap: () {
                          context.pushNamed(
                            RouteName.orderdetailsName,
                            extra: order,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
