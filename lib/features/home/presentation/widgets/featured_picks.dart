import 'package:flutter/material.dart';
import 'package:nti_final_project/features/home/presentation/widgets/products_view.dart';
import 'package:nti_final_project/features/product/presentation/screens/product_details_screen.dart';

class FeaturedPicks extends StatefulWidget {
  FeaturedPicks({super.key});

  @override
  State<FeaturedPicks> createState() => _FeaturedPicksState();
}

class _FeaturedPicksState extends State<FeaturedPicks> {
  void Function()? onPressed;
 
  

  @override
  Widget build(BuildContext context) {
    return ProductsView(sectionText: "Products",  );
  }
}
