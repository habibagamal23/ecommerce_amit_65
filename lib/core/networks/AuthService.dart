import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../features/login/model/loginreqbody.dart';
import '../../features/login/model/loginrespone.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<LoginResponse?> login(LoginRequestBody loginBody) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: loginBody.toJson(),
      );

      if (response.statusCode == 200 && response.data['token'] != null) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to login. No token received.");
      }
    } on DioError catch (e) {
      // Handle Dio-specific errors
      if (e.type == DioErrorType.connectionError) {
        print("Connection error: ${e.message}");
      } else if (e.type == DioErrorType.receiveTimeout) {
        print("Receive timeout error: ${e.message}");
      } else if (e.type == DioErrorType.badResponse) {
        print("Invalid response: ${e.response?.data}");
      } else {
        print("Login error: ${e.message}");
      }
      return null;
    } catch (e) {
      // Catch other unexpected errors
      print("Unexpected error: $e");
      return null;
    }
  }
}
