import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/token.dart';

class AddProductRemoteDataSource {
  final Dio dio = Dio();
  Future<Map<String, dynamic>> addProduct({
    required String name,
    required String description,
    required double price,
    required String categoryid,
    required int stock,
    required String imageurl,
  }) async {
    try {
      final Response response = await dio.post(
        "https://accessories-eshop.runasp.net/api/products",
        data: {
          "sellerId": "e51c257c-bec2-4dc4-35e2-08df0daa4f93",
          "name": name,
          "description": description,
          "nameArabic": name,
          "descriptionArabic": description,
          "coverPictureUrl": imageurl,
          "price": price,
          "stock": stock,
          "weight": 1,
          "color": "red",
          "discountPercentage": 0,
          "categoryIds": [categoryid],
          "productPictureUrls": [imageurl],
        },
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${Token.value}',
          },
        ),
      );
      log("Success Status Code: ${response.statusCode}");
      log("Response:${response.data}");
      return response.data;
    } on DioException catch (e) {
      log("Dio Status Code: ${e.response?.statusCode}");
      log("Dio Error Data: ${e.response?.data}");
      throw Exception(e.response?.data);
    }
  }
}
