import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/features/authentications/data/api/auth_api.dart';

class HomeRemoteData {
  final Dio dio = Dio();

  Future<List<Map<String, dynamic>>> getCategories() async {
    try {
      log('GET CATEGORY START');
      log('TOKEN: ${AuthApi.accessToken}');

      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/categories',
        options: Options(
          headers: AuthApi.accessToken != null
              ? {
                  'Authorization': 'Bearer ${AuthApi.accessToken}',
                }
              : null,
        ),
      );

      log('STATUS CODE: ${response.statusCode}');
      log('RESPONSE: ${response.data}');

      final data = response.data;

      if (data is! Map) {
        throw Exception('Invalid categories response');
      }

      final categoriesData = data['categories'];

      if (categoriesData is! List) {
        throw Exception('Invalid categories response');
      }

      final categories = categoriesData.map<Map<String, dynamic>>((item) {
        return Map<String, dynamic>.from(item as Map);
      }).toList();

      log('CATEGORIES COUNT: ${categories.length}');

      return categories;
    } on DioException catch (e) {
      log('CATEGORY ERROR: ${e.response?.data}');
      throw Exception(
        e.response?.data?['message'] ?? e.message ?? 'Category error',
      );
    } catch (e) {
      log('CATEGORY ERROR: $e');
      rethrow;
    }
  }

  Future<List> get_products() async {
    try {
      final Response response = await dio.get(
        'https://accessories-eshop.runasp.net/api/products',
      );

      return response.data['items'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  Future<List> cart_products({required String productid}) async {
    try {
      final Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/cart/items',
        data: {
          'productId': productid,
          'quantity': 1,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${AuthApi.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }
}