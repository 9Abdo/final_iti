import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_iti/feature/home/cubit/home_state.dart';
import 'package:project_iti/feature/services/home_sevices.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeServices) : super(InitStateHome());
  final HomeServices homeServices;

  Future<void> getAllProduct() async {
    emit(HomeLoadingState());
    try {
      final products = await homeServices.getHomeService();
      emit(HomeSuccessState(product: products));
    } on DioException catch (e) {
      emit(HomeFailureState(error: e.toString()));
    } catch (e) {
      emit(HomeFailureState(error: e.toString()));
    }
  }
  Future<void> getProductsByCategory(int categoryId) async {
    emit(HomeLoadingState());

    try {
      final products =
          await homeServices.getProductsByCategory(categoryId);

      emit(HomeSuccessState(product: products));
    } on DioException catch (e) {
      emit(HomeFailureState(error:e.message ?? "Oops try again"));
    } catch (e) {
      emit(HomeFailureState(error: e.toString()));
    }
  }
}
