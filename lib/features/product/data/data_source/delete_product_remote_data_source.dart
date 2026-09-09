import 'dart:developer';

import 'package:dio/dio.dart';

class DeleteProductRemoteDataSource {
  final Dio dio = Dio();
  Future<void> deleteProduct(String id) async {
    final Response response = await dio.delete(
      'https://accessories-eshop.runasp.net/api/products/$id',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODEwMDc4Mi1mMTAxLTRjNzYtMzVkOS0wOGRmMGRhYTRmOTMiLCJqdGkiOiIwODY2M2E4Yy1kNzExLTRiYWEtYWViYi1kYTM3ZGNlODM5MmUiLCJlbWFpbCI6Im1hcmlhbWFidW11c2FsbG01NUBnbWFpbC5jb20iLCJuYW1lIjoibWFyaWFtIGVtYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODkxOTQyNzUsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9._3rDOhQ7i8yUsH_2KA7V4XO5t6Ciz7JQhZQwCmsuiqI',
        },
      ),
    );

    log('response: ${response.data}');
  }
}
