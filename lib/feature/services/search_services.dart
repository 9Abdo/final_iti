import 'package:dio/dio.dart';
import 'package:project_iti/feature/models/search_model.dart';

class SearchService {
  final Dio dio;

  SearchService({required this.dio});

  Future<List<SearchModel>> searchProducts(String query) async {
    final Response response = await dio.get(
      "https://dummyjson.com/products/search?q=$query",
    );

    final List<dynamic> data = response.data["products"];

    return data
        .map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}