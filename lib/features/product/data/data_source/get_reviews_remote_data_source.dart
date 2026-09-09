import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/features/product/data/models/review_model.dart';

class GetReviewsRemoteDataSource {
  final dio = Dio();

  Future<List<GetReviewModel>> getReviews(String productId) async {
    List<GetReviewModel> reviews = [];
    try {
      final Response response = await dio.get(
        'https://accessories-eshop.runasp.net/api/reviews/$productId',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODEwMDc4Mi1mMTAxLTRjNzYtMzVkOS0wOGRmMGRhYTRmOTMiLCJqdGkiOiJkZGIwOWYwZC1iNmE2LTQ2MzAtODNiNy1iZWU4YWNhOTk0N2YiLCJlbWFpbCI6Im1hcmlhbWFidW11c2FsbG01NUBnbWFpbC5jb20iLCJuYW1lIjoibWFyaWFtIGVtYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODkxMzUzODgsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.kxzJNxC_ioo6lFvdCtaoT1jUk1wB2ocOXBnjNNoNrAc',
          },
        ),
      );
      log('PRODUCT ID: $productId');
      log('RESPONSE: ${response.data}');
      for (var element in response.data['reviews']['items']) {
        final GetReviewModel model = GetReviewModel.fromJson(element);
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
