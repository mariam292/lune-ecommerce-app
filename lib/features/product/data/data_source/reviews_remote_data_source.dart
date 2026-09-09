import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/features/product/data/models/review_model.dart';

class ReviewsRemoteDataSource {
  final dio = Dio();

  Future<List<ReviewModel>> getReviews(String productId) async {
    List<ReviewModel> reviews = [];
    try {
      final Response response = await dio.get(
        'https://accessories-eshop.runasp.net/api/reviews/${productId}',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiIxMTYwNTRjYy01OTU4LTQxNjUtYjNlYi00MzA2Y2JmOGFlNzciLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg5MTE1MjI0LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.XcMmtpsfncKDs1H3DcYAcuDy0jP7uF8z_6xLUv3C96c',
          },
        ),
      );
      log('PRODUCT ID: $productId');
      log('RESPONSE: ${response.data}');
      for (var element in response.data['reviews']['items']) {
        final ReviewModel model = ReviewModel.fromJson(element);
        reviews.add(model);
      }

      return reviews;
    } on DioException catch (e) {
      log('STATUS CODE: ${e.response?.statusCode}');
      log('RESPONSE: ${e.response?.data}');
      log('ERROR: ${e.message}');
      throw Exception(e.message);
    }
  }
}
