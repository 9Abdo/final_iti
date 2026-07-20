import 'package:project_iti/feature/models/home_model.dart';

abstract class FavouriteState {}

class FavouriteInitState extends FavouriteState {}

class NoFavouriteState extends FavouriteState {}

class FavouriteSuccessState extends FavouriteState {
  final List<Homemodel> product;

  FavouriteSuccessState({required this.product});
}

class FavouriteFailureState extends FavouriteState {
  final String error;

  FavouriteFailureState({required this.error});

}
