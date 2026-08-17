import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/routing/route_const.dart';
import 'package:project_iti/feature/orders/cubit/order_cubit.dart';
import 'package:project_iti/feature/orders/cubit/order_state.dart';
import 'package:project_iti/feature/orders/views/no_order_page.dart';
import 'package:project_iti/feature/orders/widget/orderitem.dart';
import 'package:project_iti/feature/services/order_services.dart';

class CompletedPageView extends StatelessWidget {
  const CompletedPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return BlocProvider(
      create: (context) => OrderCubit(OrderServices())..listenOrders(userId),

      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is OrderError) {
            return Center(child: Text(state.message));
          }

          if (state is OrderSuccess) {
            final completedOrders = state.orders
                .where((order) => order.status == "Delivered")
                .toList();

            if (completedOrders.isEmpty) {
              return const NoOrderPage();
            }

            return ListView.builder(
              padding: EdgeInsets.only(top: 10.h),
              itemCount: completedOrders.length,
              itemBuilder: (context, index) {
                final order = completedOrders[index];

                return OrderItem(
                  id: order.id,
                  status: order.status,
                  date: order.date.toString(),
                  price: order.total,
                  onTap: () {
                    context.pushNamed(RouteName.orderdetailsName, extra: order);
                  },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
