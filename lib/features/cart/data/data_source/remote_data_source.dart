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
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiI3NDRjOWM3NC0zYTgyLTRlOTUtYWIwZC1lYTA4NzA2MWFhMmMiLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg5MTExODk3LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.c9bErANskia-zuMJM4Gl369_OicKtescWXFByBAFGGU',
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
