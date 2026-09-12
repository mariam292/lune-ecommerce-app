import 'package:flutter/material.dart';

import 'package:nti_final_project/core/app_colors.dart';

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
      elevation: 0,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: pictureUrl.isNotEmpty
                ? Image.network(
                    pictureUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        color: AppColors.backGroundColor,
                        child: const Center(
                          child: Icon(
                            Icons.category_outlined,
                            size: 55,
                            color: AppColors.color5A3036,
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    width: double.infinity,
                    color: AppColors.backGroundColor,
                    child: const Center(
                      child: Icon(
                        Icons.category_outlined,
                        size: 55,
                        color: AppColors.color5A3036,
                      ),
                    ),
                  ),
          ),

          SizedBox(
            height: 36,
            child: Center(
              child: Text(
                categoryName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}