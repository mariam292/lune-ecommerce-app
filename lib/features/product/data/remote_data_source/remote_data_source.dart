import 'dart:developer';

import 'package:dio/dio.dart';

class AddProductRemoteDataSource {
  final Dio dio = Dio();
  Future<Map<String, dynamic>> addProduct({
    required String name,
    required String description,
    required double price,
    required String categoryid,
    required int stock,
    required String imageurl
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
          "coverPictureUrl":
              imageurl,
          "price": price,
          "stock": stock,
          "weight": 1,
          "color": "red",
          "discountPercentage": 0,
          "categoryIds": [categoryid],
          "productPictureUrls": [
            imageurl,
          ],
        },
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiIxMTYwNTRjYy01OTU4LTQxNjUtYjNlYi00MzA2Y2JmOGFlNzciLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg5MTE1MjI0LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.XcMmtpsfncKDs1H3DcYAcuDy0jP7uF8z_6xLUv3C96c',
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
