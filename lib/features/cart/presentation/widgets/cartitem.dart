import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';



class CartItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productCategory;
  final String productPrice;

  const CartItem({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColors.color7A6E6B),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          productName,
                          style: AppStyles.style16SemiBold.copyWith(
                            color: AppColors.blackColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.cancel_outlined,
                          color: AppColors.color7A6E6B,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),

                  Text(
                    productCategory,
                    style: AppStyles.style16Regular.copyWith(
                      color: AppColors.color7A6E6B,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "$productPrice EGP",
                        style: AppStyles.style16SemiBold.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.color7A6E6B),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: AppColors.color7A6E6B,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text('1', style: AppStyles.style12SemiBold),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: AppColors.color7A6E6B,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
