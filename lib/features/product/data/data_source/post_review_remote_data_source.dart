import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/token.dart';

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
                'Bearer ${Token.value}',
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
