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
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODEwMDc4Mi1mMTAxLTRjNzYtMzVkOS0wOGRmMGRhYTRmOTMiLCJqdGkiOiIwODY2M2E4Yy1kNzExLTRiYWEtYWViYi1kYTM3ZGNlODM5MmUiLCJlbWFpbCI6Im1hcmlhbWFidW11c2FsbG01NUBnbWFpbC5jb20iLCJuYW1lIjoibWFyaWFtIGVtYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODkxOTQyNzUsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9._3rDOhQ7i8yUsH_2KA7V4XO5t6Ciz7JQhZQwCmsuiqI',
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
