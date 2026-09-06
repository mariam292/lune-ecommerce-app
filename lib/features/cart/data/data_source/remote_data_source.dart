import 'dart:developer';

import 'package:dio/dio.dart';

class CartRemoteDataSource {
  final Dio dio = Dio();
  Future<List> getcart() async {
    try {
      List mycart = [];
      final Response response = await dio.get(
        "https://accessories-eshop.runasp.net/api/cart",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiJlYzg2MTY5Ny1jMjA2LTRmNGMtOTBmMC1lM2IyOGVjY2M3YWEiLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg4ODg3NTk0LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.iJIiSMf2gGeKG8UKDciuHYzN8V7v0n1h0O_b5_lMI80',
          },
        ),
      );
      log("Rsponse:$response");
      mycart = response.data["cartItems"];
      return mycart;
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? 'Error');
      throw Exception(e.response?.data);
    }
  }
}
