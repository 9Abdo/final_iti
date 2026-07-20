
import 'package:project_iti/feature/models/home_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Homemodel> products;

  SearchSuccess(this.products);
}

class SearchFailure extends SearchState {
  final String error;

  SearchFailure(this.error);
}