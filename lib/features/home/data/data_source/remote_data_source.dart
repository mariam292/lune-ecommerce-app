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
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiIxMTYwNTRjYy01OTU4LTQxNjUtYjNlYi00MzA2Y2JmOGFlNzciLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg5MTE1MjI0LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.XcMmtpsfncKDs1H3DcYAcuDy0jP7uF8z_6xLUv3C96c',
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
