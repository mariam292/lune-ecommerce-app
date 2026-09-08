import 'dart:developer';

import 'package:dio/dio.dart';

class OffersRemoteDataSource {
  final Dio dio = Dio();
  Future<List> getoffers() async {
    try {
      List myoffers = [];
      final Response response = await dio.get(
        "https://accessories-eshop.runasp.net/api/offers",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiJlYzg2MTY5Ny1jMjA2LTRmNGMtOTBmMC1lM2IyOGVjY2M3YWEiLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg4ODg3NTk0LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.iJIiSMf2gGeKG8UKDciuHYzN8V7v0n1h0O_b5_lMI80',
          },
        ),
      );
      log("Response:${response.data["offers"]["items"]}");
      myoffers = response.data["offers"]["items"];
      return myoffers;
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? 'Error');
      throw Exception(e.response?.data);
    }
  }

  Future<Map> showoffers({
    required String name,
    required String description,
    required String imageurl,
  }) async {
    try {
      final Response response = await dio.post(
        "https://accessories-eshop.runasp.net/api/offers",
        data: {
          "name": name,
          "description": description,
          "offerCoverUrl": imageurl,
        },
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiJlYmFhNzE0My1lNmU5LTQxZDUtODY1Ny0zMDlmNzk5MDRkODciLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg5MDA0ODQ2LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.WLjU1upIu4klqZii2-C9rBIENMJRTzp7RBz_LeiatAw',
          },
        ),
      );
      log("Success Status Code: ${response.statusCode}");
      log("Response:${response.data}");
      return response.data;
    } on DioException catch (e) {
      log("Dio Status Code: ${e.response?.statusCode}");
      log("Dio Error Data: ${e.response?.data}");
      throw Exception(e.response?.data);
    }
  }
}
