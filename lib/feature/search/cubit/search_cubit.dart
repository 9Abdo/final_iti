import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_iti/feature/search/cubit/search_state.dart';
import 'package:project_iti/feature/services/search_services.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.service) : super(SearchInitial());

  final SearchService service;
  String lastQuery = "";

  Future<void> search(String text) async {
    lastQuery = text;
    emit(SearchLoading());

    try {
      final result = await service.searchProducts(text);
      print(result.length);
      await Future.delayed(const Duration(seconds: 2));
      emit(SearchSuccess(result));
      print("Success emitted");
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
