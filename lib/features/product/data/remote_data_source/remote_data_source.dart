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
              "https://images.unsplash.com/photo-1584917865442-de89df76afd3",
          "price": price,
          "stock": stock,
          "weight": 1,
          "color": "red",
          "discountPercentage": 0,
          "categoryIds": [categoryid],
          "productPictureUrls": [
            "https://cdn.phototourl.com/free/2026-09-08-95efef8b-b53a-456f-a255-6f2208d2b4d2.png",
          ],
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODEwMDc4Mi1mMTAxLTRjNzYtMzVkOS0wOGRmMGRhYTRmOTMiLCJqdGkiOiJkZGIwOWYwZC1iNmE2LTQ2MzAtODNiNy1iZWU4YWNhOTk0N2YiLCJlbWFpbCI6Im1hcmlhbWFidW11c2FsbG01NUBnbWFpbC5jb20iLCJuYW1lIjoibWFyaWFtIGVtYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODkxMzUzODgsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.kxzJNxC_ioo6lFvdCtaoT1jUk1wB2ocOXBnjNNoNrAc',

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
