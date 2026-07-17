import 'package:dio/dio.dart';
import 'package:project_iti/core/constant/app_endpoint.dart';
import 'package:project_iti/feature/models/home_model.dart';


class HomeServices {
  final Dio dio;
  HomeServices({required this.dio});
  Future<List<Homemodel>> getHomeService() async {
    Response response = await dio.get(
      AppEndpoint.product
    );
    List homeDate = response.data;
    List<Homemodel> dateHome = homeDate
        .map((e) => Homemodel.fromjson(e))
        .toList();
    return dateHome;
  }
  Future<List<Homemodel>> getProductsByCategory(int categoryId) async {
    Response response = await dio.get(
      "https://api.escuelajs.co/api/v1/categories/$categoryId/products",
    );

    List data = response.data;

    return data
        .map((e) => Homemodel.fromjson(e))
        .toList();
  }
}
