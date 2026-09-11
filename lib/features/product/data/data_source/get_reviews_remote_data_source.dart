import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/token.dart';
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
                'Bearer ${Token.value}',
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
