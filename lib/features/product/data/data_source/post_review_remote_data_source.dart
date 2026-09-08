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

        data: {
          "productId": productId,
          "comment": comment,
        },
      );

      log('response:${response.data}');
    } on DioException catch (e) {
      log('error is ${e.error}');
    }
  }
}




