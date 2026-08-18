import 'dart:developer';

import 'package:dio/dio.dart';

class ChatBotServices {
  final Dio dio;

  ChatBotServices({required this.dio});
  Future<String> postMessage({required String message}) async {
    final response = await dio.post(
      "https://abdosabry99.app.n8n.cloud/webhook/ecommerce-chat",
      data: {"chatInput": message},
    );
    log(response.data.toString());
    log(response.statusCode.toString());

    return response.data.toString();
  }
}
