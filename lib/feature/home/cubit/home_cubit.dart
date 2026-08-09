import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_iti/feature/home/cubit/home_state.dart';
import 'package:project_iti/feature/services/home_sevices.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeServices) : super(InitStateHome());

  final HomeServices homeServices;

  Future<void> getHomeProducts() async {
    emit(HomeLoadingState());

    try {
      final results = await Future.wait([
        homeServices.getHomeService(),
        homeServices.getProducts_2(),
      ]);

      final featuredProducts = results[0];
      final popularProducts = results[1];

      emit(
        HomeSuccessState(
          product: featuredProducts,
          popularProducts: popularProducts,
        ),
      );
    } on DioException catch (e) {
      emit(
        HomeFailureState(
          error: e.message ?? "Oops try again",
        ),
      );
    } catch (e) {
      emit(
        HomeFailureState(
          error: e.toString(),
        ),
      );
    }
  }
}