import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_iti/core/constant/app_endpoint.dart';

class DioHelper {
  static Dio? dio;
  static initiDio() {
    dio ??=
        Dio(
          BaseOptions(
            baseUrl: AppEndpoint.baseUrl,
            receiveDataWhenStatusError: true,
          ),
        );
    dio!.interceptors.add(PrettyDioLogger());
  }
}
