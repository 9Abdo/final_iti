
import 'package:project_iti/feature/models/home_model.dart';

abstract class HomeState {}

class InitStateHome extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Homemodel> product;

  HomeSuccessState({required this.product});
}

class HomeFailureState extends HomeState {
  final String error;

  HomeFailureState({required this.error});
}
