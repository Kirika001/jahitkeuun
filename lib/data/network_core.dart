import 'package:dio/dio.dart';
import 'package:jahitkeeun/const/app_constant.dart';

class NetworkCore {
  Dio dio = Dio();

  NetworkCore() {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    );
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
