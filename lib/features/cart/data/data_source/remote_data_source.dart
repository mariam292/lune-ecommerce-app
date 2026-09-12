import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/token.dart';

class CartRemoteDataSource {
  final Dio dio = Dio();
  Future<List> getcart() async {
    try {
      List mycart = [];
      final Response response = await dio.get(
        "https://accessories-eshop.runasp.net/api/cart",
        options: Options(headers: {'Authorization': 'Bearer ${Token.value}'}),
      );
      log("Rsponse:$response");
      mycart = response.data["cartItems"];
      return mycart;
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? 'Error');
      throw Exception(e.response?.data);
    }
  }

  Future<void> postQuantity({
    required String productId,
    required int quantity,
  }) async {
    await dio.post(
      'https://accessories-eshop.runasp.net/api/cart/items',
      data: {'productId': productId, 'quantity': quantity},
    );
  }
}
