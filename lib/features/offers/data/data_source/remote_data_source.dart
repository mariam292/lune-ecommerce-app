import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/token.dart';

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
                'Bearer ${Token.value}',
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
                'Bearer ${Token.value}',
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
