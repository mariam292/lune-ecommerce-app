import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/token.dart';

class ForgotPassRemoteDataSource {
  final dio = Dio();

  Future<void> forgotPassData({required String email}) async {
    await dio.post(
      'https://accessories-eshop.runasp.net/api/auth/forgot-password',

      data: {'email': email},
      options: Options(headers: {'Authorization': 'Bearer ${Token.value}'}),
    );
  }
}
