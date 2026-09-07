import 'dart:developer';

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
 


Future<List> cart_products({required praductid}) async {
    

    try {
      final Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/cart/items'
        ,data:{

            "productId":praductid,
  "quantity":1}
  //,options: Options(headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ZWNkZWE0Yi03NDYyLTRiZjctMzVhMS0wOGRmMGMzZjg1NmQiLCJqdGkiOiJjMGNmMTlmYS1iZmU5LTQwODEtYjU2MC1lNzNhMzg0MWFjMDgiLCJlbWFpbCI6InphaHJhMDUubW9oYW1lZEBnbWFpbC5jb20iLCJuYW1lIjoiemFocmEgbW9oYW1lZCIsInJvbGVzIjoiIiwicGljdHVyZSI6IiIsImV4cCI6MTc4OTAyMzE3MiwiaXNzIjoiZXNob3AubmV0IiwiYXVkIjoiZXNob3AubmV0In0.ohiLUn7QtK2jkabSwzzKluoao4cm9fZA5ceh0XEQ3AA'})
        
        
        ); 
         log("${response.data.toString()}");
   return  response.data ;
       
          
       
     
    } on DioException catch (e) {
       
        throw Exception (e.response?.data.toString() );
    }
  }

 

Future<List> get_categories()async{
   
log("before res");

 
  final Response response =await dio.get("https://accessories-eshop.runasp.net/api/categories"
  ,options: Options(headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTE5ZjczYy1kOGYwLTQ2YzYtNTE4Yi0wOGRmMGJkM2MwOGUiLCJqdGkiOiJlYzg2MTY5Ny1jMjA2LTRmNGMtOTBmMC1lM2IyOGVjY2M3YWEiLCJlbWFpbCI6InJhZ2hhZG1vaGFtZWQ1NDVAZ21haWwuY29tIiwibmFtZSI6InJhZ2hhZCBtb2hhbWVkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg4ODg3NTk0LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.iJIiSMf2gGeKG8UKDciuHYzN8V7v0n1h0O_b5_lMI80'}
  ));
  log(response.data.toString());
  log(response.data);
  return response.data["categories "];     
    
 
}







}