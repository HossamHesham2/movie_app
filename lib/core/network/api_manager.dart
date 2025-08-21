import 'package:dio/dio.dart';
import 'package:movie_app/core/network/app_interceptor.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://yts.mx/api",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {"Content-Type": "application/json"},
      ),
    );
    dio.interceptors.add(AppInterceptor());
  }

  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get(endPoint, queryParameters: queryParameters);
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> post(String endPoint, {Map<String, dynamic>? data}) async {
    try {
      return await dio.post(endPoint, data: data);
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> delete(String endPoint, {Map<String, dynamic>? data}) async {
    try {
      return await dio.delete(endPoint, data: data);
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> put(String endPoint, {Map<String, dynamic>? data}) async {
    try {
      return await dio.put(endPoint, data: data);
    } catch (error) {
      rethrow;
    }
  }
}
