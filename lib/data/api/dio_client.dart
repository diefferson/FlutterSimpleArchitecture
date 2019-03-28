
import 'package:dio/dio.dart';

class DioClient {

  static Dio getClient(String baseUrl, String apiKey){
      return Dio(_dioOptions(baseUrl, apiKey))
        ..interceptors.add(LogInterceptor(responseBody: true));

  }

  static _dioOptions(String baseUrl, String apiKey) => BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      queryParameters: { "api_key": apiKey}
  );
}