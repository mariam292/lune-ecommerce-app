import 'package:flutter/material.dart';
import 'package:lune/app_colors.dart';
import 'package:lune/AppFonts.dart';
import 'package:lune/products_view.dart';

class FeaturedPicks extends StatelessWidget {
  FeaturedPicks({super.key});
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
      section_text: "Featured Picks",
      onPressed: onPressed,
      products: products,
    );
  }
}
