import 'package:dio/dio.dart';

class QuantityDataSource {
  final Dio dio = Dio();
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
