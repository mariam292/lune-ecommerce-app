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
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiI3NDRjOWM3NC0zYTgyLTRlOTUtYWIwZC1lYTA4NzA2MWFhMmMiLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg5MTExODk3LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.c9bErANskia-zuMJM4Gl369_OicKtescWXFByBAFGGU',
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
