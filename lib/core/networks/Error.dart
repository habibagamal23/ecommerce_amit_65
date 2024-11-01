import 'package:dio/dio.dart';

Exception handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      return Exception("Connection error: ${e.message}");
    case DioExceptionType.badResponse:
      return Exception("Invalid response: ${e.response?.data}");
    default:
      return Exception("Load error: ${e.message}");
  }
}
