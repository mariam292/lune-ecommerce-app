import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/features/home/data/models/product_model.dart';

class HomeRemoteData {
  final dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];
    try {
      final Response response = await dio.get(
        'https://accessories-eshop.runasp.net/api/products',
        // return response.data['items'];
        // data: {"page": 3},
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

  Future<dynamic> cartProducts({required praductid}) async {
    try {
      final Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/cart/items',
        data: {"productId": praductid, "quantity": 1},
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODEwMDc4Mi1mMTAxLTRjNzYtMzVkOS0wOGRmMGRhYTRmOTMiLCJqdGkiOiIwODY2M2E4Yy1kNzExLTRiYWEtYWViYi1kYTM3ZGNlODM5MmUiLCJlbWFpbCI6Im1hcmlhbWFidW11c2FsbG01NUBnbWFpbC5jb20iLCJuYW1lIjoibWFyaWFtIGVtYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODkxOTQyNzUsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9._3rDOhQ7i8yUsH_2KA7V4XO5t6Ciz7JQhZQwCmsuiqI',
          },
        ),
      );
      log("${response.data.toString()}");
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data.toString());
    }
  }

  Future<List> getCategories() async {
    log("before res");

    try {
      final Response response = await dio.get(
        "https://accessories-eshop.runasp.net/api/categories",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODEwMDc4Mi1mMTAxLTRjNzYtMzVkOS0wOGRmMGRhYTRmOTMiLCJqdGkiOiJjNWJhNzUwNi03NzM0LTQ3Y2EtYjUzMy0zNzIxNzM2MzgzYmMiLCJlbWFpbCI6Im1hcmlhbWFidW11c2FsbG01NUBnbWFpbC5jb20iLCJuYW1lIjoibWFyaWFtIGVtYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODkxMDU0NDksImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.tRC5Ra3HL4qQypbaEI6eHmTLcI82T9cVx_gEEYezf0I',
          },
        ),
      );
      log(response.data.toString());
      log("after res");

      return response.data["categories"];
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
