import 'package:dio/dio.dart';
import 'package:project_iti/feature/models/home_model.dart';


class SearchService {
  final Dio dio;

  SearchService({required this.dio});

  Future<List<Homemodel>> searchProducts(String query) async {
    final Response response = await dio.get(
      "https://dummyjson.com/products/search?q=$query",
    );

    final List<dynamic> data = response.data["products"];

    return data
        .map((e) => Homemodel.fromjson(e as Map<String, dynamic>))
        .toList();
  }
}