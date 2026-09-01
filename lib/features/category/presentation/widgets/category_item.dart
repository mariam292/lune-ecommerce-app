import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.pictureUrl, required this.categoryName});
  final String pictureUrl, categoryName;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),

            child: Image.asset(pictureUrl, fit: BoxFit.cover),
          ),

          Text(categoryName),
        ],
      ),
    );
  }
}