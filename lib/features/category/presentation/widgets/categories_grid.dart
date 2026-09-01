import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  final List<Map<String, String>> categories = const [
    {'name': 'Jewelry', 'image': 'assets/images/cat1.png'},
    {'name': 'Bags', 'image': 'assets/images/cat2.png'},
    {'name': 'Scarves', 'image': 'assets/images/cat3.png'},
    {'name': 'Watches', 'image': 'assets/images/cat4.png'},
    {'name': 'Sunglasses', 'image': 'assets/images/cat5.png'},
    {'name': 'Hair Accessories', 'image': 'assets/images/cat6.png'},
    {'name': 'Belts', 'image': 'assets/images/cat7.png'},
    {'name': 'Fragrance', 'image': 'assets/images/cat8.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 167 / 155,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryCard(
          name: category['name']!,
          imagePath: category['image']!,
        );
      },
    );
  }
}