import 'package:dio/dio.dart';

class AuthApi {
  final Dio dio = Dio();

  static String? accessToken;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      'https://accessories-eshop.runasp.net/api/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    accessToken = response.data['accessToken'];
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    await dio.post(
      'https://accessories-eshop.runasp.net/api/auth/change-password',
      data: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirmNewPassword': confirmNewPassword,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}