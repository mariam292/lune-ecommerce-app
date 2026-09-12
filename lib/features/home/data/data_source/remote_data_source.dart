import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/token.dart';
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
        options: Options(headers: {'Authorization': 'Bearer ${Token.value}'}),
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
        options: Options(headers: {'Authorization': 'Bearer ${Token.value}'}),
      );
      log(response.data.toString());
      log("after res");

      return response.data["categories"];
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
