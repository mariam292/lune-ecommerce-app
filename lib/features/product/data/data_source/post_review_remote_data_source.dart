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
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODEwMDc4Mi1mMTAxLTRjNzYtMzVkOS0wOGRmMGRhYTRmOTMiLCJqdGkiOiJjNWJhNzUwNi03NzM0LTQ3Y2EtYjUzMy0zNzIxNzM2MzgzYmMiLCJlbWFpbCI6Im1hcmlhbWFidW11c2FsbG01NUBnbWFpbC5jb20iLCJuYW1lIjoibWFyaWFtIGVtYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODkxMDU0NDksImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.tRC5Ra3HL4qQypbaEI6eHmTLcI82T9cVx_gEEYezf0I',
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
