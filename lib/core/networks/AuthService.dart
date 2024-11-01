import 'package:dio/dio.dart';
import '../../features/login/model/loginreqbody.dart';
import '../../features/login/model/loginrespone.dart';
import 'Error.dart';

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

    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      print("Unexpected error: $e");
      return null;
    }
  }
}
