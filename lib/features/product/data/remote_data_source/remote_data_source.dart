import 'dart:developer';

import 'package:dio/dio.dart';

class AddProductRemoteDataSource {
  final Dio dio = Dio();
  Future<List> addProduct({
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
          "sellerId": "d051dbf3-f5d8-410d-0e50-08de06562562",
          "name": name,
          "description": description,
          "nameArabic": name,
          "descriptionArabic": description,
          "coverPictureUrl": "https://images.unsplash.com/photo-1584917865442-de89df76afd3",
          "price": price,
          "stock": stock,
          "weight": 1,
          "color": "red",
          "discountPercentage": 0,
          "categoryIds": [categoryid],
          "productPictureUrls": ["https://images.unsplash.com/photo-1584917865442-de89df76afd3"],

          Options: Options(
            headers: {
              'Authorization':
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiJhOGUyODc5MC01NzkyLTQ1NmYtODI1MS04YWYzYTFkMzdlYWEiLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg4OTI1NzY1LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.n9wuFtvPCZQgSU7bjasMpmpRXqh3rU6fX2f3ofL29Tg',
            },          ),
        },
      );
      log("Success Status Code: ${response.statusCode}");
      log("Response:${response.data}");
      List myproduct = response.data;
      return myproduct;
    } on DioException catch (e) {
      log("Dio Status Code: ${e.response?.statusCode}");
      log("Dio Error Data: ${e.response?.data}");
      throw Exception(e.response?.data);
    }
  }
}
