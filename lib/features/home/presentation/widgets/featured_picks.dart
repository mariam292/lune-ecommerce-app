import 'package:flutter/material.dart';
import 'package:nti_final_project/features/home/presentation/widgets/products_view.dart';
import 'package:nti_final_project/features/product/presentation/screens/product_details_screen.dart';

class FeaturedPicks extends StatelessWidget {
  FeaturedPicks({super.key});
  void Function()? onPressed;
  List<Map> products = [
    {
      "img": "assets/images/ImageFrame.png",
      "category": "CURATED SERIES",
      "product_name": "Aurore Pearl Drops",
      "price": "145.00",
    },
    {
      "img": "assets/images/ImageFrame.png",
      "category": "CURATED SERIES",
      "product_name": "Aurore Pearl Drops",
      "price": "145.00",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ProductsView(
      section_text: "Products",
      onPressed:  () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Productdetailsscreen()),
          ),
      products: products,
    );
  }
}
