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
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODEwMDc4Mi1mMTAxLTRjNzYtMzVkOS0wOGRmMGRhYTRmOTMiLCJqdGkiOiJkZGIwOWYwZC1iNmE2LTQ2MzAtODNiNy1iZWU4YWNhOTk0N2YiLCJlbWFpbCI6Im1hcmlhbWFidW11c2FsbG01NUBnbWFpbC5jb20iLCJuYW1lIjoibWFyaWFtIGVtYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODkxMzUzODgsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.kxzJNxC_ioo6lFvdCtaoT1jUk1wB2ocOXBnjNNoNrAc',
        },
      ),
    );

    log('response: ${response.data}');
  }
}
