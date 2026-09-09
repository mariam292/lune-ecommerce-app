import 'dart:developer';

import 'package:dio/dio.dart';

class PostReviewRemoteDataSource {
  final dio = Dio();

  Future<void> postReviewData({
    required String productId,
    required String comment,
  }) async {
    try {
      final Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/reviews/$productId',

        data: {"productId": productId, "comment": comment, "rating": 5},
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODEwMDc4Mi1mMTAxLTRjNzYtMzVkOS0wOGRmMGRhYTRmOTMiLCJqdGkiOiJkZGIwOWYwZC1iNmE2LTQ2MzAtODNiNy1iZWU4YWNhOTk0N2YiLCJlbWFpbCI6Im1hcmlhbWFidW11c2FsbG01NUBnbWFpbC5jb20iLCJuYW1lIjoibWFyaWFtIGVtYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODkxMzUzODgsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.kxzJNxC_ioo6lFvdCtaoT1jUk1wB2ocOXBnjNNoNrAc',
          },
        ),
      );

      log('status code:${response.statusCode}');
    } on DioException catch (e) {
      log('STATUS CODE: ${e.response?.statusCode}');
      log('RESPONSE: ${e.response?.data}');
      log('ERROR: ${e.message}');

      rethrow;
    }
  }
}
