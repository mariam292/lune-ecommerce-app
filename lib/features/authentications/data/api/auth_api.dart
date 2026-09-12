import 'package:dio/dio.dart';

class AuthApi {
  final Dio dio = Dio();

  static String? accessToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODEwMDc4Mi1mMTAxLTRjNzYtMzVkOS0wOGRmMGRhYTRmOTMiLCJqdGkiOiIwODY2M2E4Yy1kNzExLTRiYWEtYWViYi1kYTM3ZGNlODM5MmUiLCJlbWFpbCI6Im1hcmlhbWFidW11c2FsbG01NUBnbWFpbC5jb20iLCJuYW1lIjoibWFyaWFtIGVtYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODkxOTQyNzUsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9._3rDOhQ7i8yUsH_2KA7V4XO5t6Ciz7JQhZQwCmsuiqI';

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