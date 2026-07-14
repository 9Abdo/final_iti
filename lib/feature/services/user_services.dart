import 'package:dio/dio.dart';
import 'package:project_iti/feature/models/user_model.dart';

class UserServices {
 
  final Dio dio;

  UserServices({required this.dio});

  Future<UserModel> postLogin({  required String username,
    required String password}) async {
    Response response = await dio.post(
      "https://api.escuelajs.co/api/v1/auth/login",
      data: {
        'email': username,
        'password': password
      },
    );
    return UserModel.fromjson(response.data);
  }
}
