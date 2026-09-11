import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/token.dart';

class DeleteProductRemoteDataSource {
  final Dio dio = Dio();
  Future<void> deleteProduct(String id) async {
    final Response response = await dio.delete(
      'https://accessories-eshop.runasp.net/api/products/$id',
      options: Options(
        headers: {
          'Authorization':
              'Bearer ${Token.value}',
        },
      ),
    );

    log('response: ${response.data}');
  }
}
