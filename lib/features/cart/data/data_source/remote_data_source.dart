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
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiIxMTYwNTRjYy01OTU4LTQxNjUtYjNlYi00MzA2Y2JmOGFlNzciLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg5MTE1MjI0LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.XcMmtpsfncKDs1H3DcYAcuDy0jP7uF8z_6xLUv3C96c',
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
