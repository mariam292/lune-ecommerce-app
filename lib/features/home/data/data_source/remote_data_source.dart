import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/features/home/data/product_model.dart';

class HomeRemoteData {
  final dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];
    try {
      final Response response = await dio.get(
        'https://accessories-eshop.runasp.net/api/products',
      );
      for (var element in response.data['items']) {
        final ProductModel model = ProductModel.fromJson(element);
        products.add(model);
      }

      return products;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  Future<List> cart_products({required praductid}) async {
    try {
      final Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/cart/items',
        data: {"productId": praductid, "quantity": 1},
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiJlYzg2MTY5Ny1jMjA2LTRmNGMtOTBmMC1lM2IyOGVjY2M3YWEiLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg4ODg3NTk0LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.iJIiSMf2gGeKG8UKDciuHYzN8V7v0n1h0O_b5_lMI80',
          },
        ),
      );
      log("${response.data.toString()}");
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data.toString());
    }
  }

  Future<List> get_categories() async {
    log("before res");
    try {
      final Response response = await dio.get(
        "https://accessories-eshop.runasp.net/api/categories",
      );
      log(response.data.toString());
      return response.data["categories"];
      log("afater res");
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }
}
