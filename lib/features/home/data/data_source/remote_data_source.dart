import 'package:dio/dio.dart';

class HomeRemoteData 

{

final  dio =Dio();

Future<List> get_products()async
{

try {
  final Response response =await dio.get('https://accessories-eshop.runasp.net/api/products');
  
  return response.data["items"];
} on DioException catch (e) {
   throw Exception(e.response?.data['message'] );
}










}










}