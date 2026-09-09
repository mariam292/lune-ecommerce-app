import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.pictureUrl,
    required this.categoryName,
  });

  final String pictureUrl;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              pictureUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox();
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(categoryName),
          ),
        ],
      ),
    );
  }
}