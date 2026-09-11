import 'package:dio/dio.dart';
import 'package:nti_final_project/core/token.dart';

class ResetPassDataSource {
  final dio = Dio();

  Future<void> resetPassData({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    await dio.post(
      'https://accessories-eshop.runasp.net/api/auth/reset-password',

      data: {'email': email, 'otp': otp, 'newPassword': newPassword},

      options: Options(headers: {'Authorization': 'Bearer ${Token.value}'}),
    );
  }
}
