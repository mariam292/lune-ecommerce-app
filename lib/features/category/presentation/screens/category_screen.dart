import 'package:flutter/material.dart';
import 'package:nti_final_project/features/category/presentation/widgets/category_item.dart';
import 'package:nti_final_project/features/category/presentation/widgets/category_top_bar.dart';
import '../../../../core/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static List categoryList = [
    CategoryItem(pictureUrl: 'assets/images/cat1.png', categoryName: 'Jewelry'),

    CategoryItem(pictureUrl: 'assets/images/cat2.png', categoryName: 'Bags'),

    CategoryItem(pictureUrl: 'assets/images/cat3.png', categoryName: 'Scarves'),

    CategoryItem(pictureUrl: 'assets/images/cat4.png', categoryName: 'Watches'),

    CategoryItem(pictureUrl: 'assets/images/cat5.png', categoryName: 'Sunglasses'),

    CategoryItem(pictureUrl: 'assets/images/cat8.png', categoryName: 'Fragrance')
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CategoryTopBar(),

            Expanded(
              child: GridView.builder(
                itemCount: categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 167 / 155,
                ),
                itemBuilder: (context, index) {
                  return categoryList[index]
                  ;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}