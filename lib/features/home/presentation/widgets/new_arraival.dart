 import 'package:flutter/cupertino.dart';
import 'package:nti_final_project/features/home/presentation/widgets/products_view.dart';

class NewArraival extends StatelessWidget{
    NewArraival({super.key});
 
  void Function()? onPressed;
  List<Map> products = [
    {
      "img": 'assets/images/ImageFrame (1).png',
      "category": "CURATED SERIES",
      "product_name": "Aurore Pearl Drops",
      "price": "145.00",
    },
      { 
      "img": 'assets/images/ImageFrame (1).png',
      "category": "CURATED SERIES",
      "product_name": "Aurore Pearl Drops",
      "price": "145.00",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ProductsView(
      section_text: "New Arrivals",
      onPressed: onPressed,
      products: products,
    );
  }
}


























