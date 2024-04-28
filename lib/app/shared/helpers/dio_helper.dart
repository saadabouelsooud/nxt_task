import 'package:dio/dio.dart';
import 'package:task/app/shared/helpers/interceptor_helper.dart';

final class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      contentType: Headers.jsonContentType,
      validateStatus: (status) => status! < 500,
    ),
  );

  DioClient._();

  static final instance = DioClient._();

  Dio get dio => _dio;
}

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio.interceptors.add(const TokenInterceptor());
  }

  Future<Response> get(String path) async {
    return await _dio.get(path);
  }
}
