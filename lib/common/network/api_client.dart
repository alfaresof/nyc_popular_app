import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_interceptor.dart';

class DioClient {
  final _dio = Dio();

  DioClient(// settings,
      // appAuth,
      ) {
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
    _dio.interceptors.add(DioInterceptor(dio));
    // if (AppEnvironment.environment == Environment.dev) {

    // }
  }

  Dio get dio => _dio;
}
