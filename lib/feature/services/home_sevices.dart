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
  Future<List<Homemodel>> getProducts_2() async {
    Response response = await dio.get(
      "https://dummyjson.com/products"
    );

    List data = response.data['products'];

    return data
        .map((e) => Homemodel.fromjson(e))
        .toList();
  }
}
