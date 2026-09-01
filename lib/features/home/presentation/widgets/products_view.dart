import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/cart/presentation/screens/cart_screen.dart';

class ProductsView extends StatelessWidget {
  ProductsView({
    super.key,
    required this.section_text,
    required this.onPressed,
    required this.products,
  });
  final section_text;
  void Function()? onPressed;
  final List products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              section_text,
              style: AppStyles.style20SemiBold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
          ],
        ),

        SizedBox(
          height: 300,
          width: double.infinity,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisExtent: 300,
            ),
            shrinkWrap: true,
            itemCount: products.length,

            itemBuilder: (context, index) {
              return Column(
                spacing: 10,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 209,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),

                            image: DecorationImage(
                              image: AssetImage(products[index]["img"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          left: 110,
                          right: 0,
                          top: 0,
                          bottom: 150,

                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/LikeBadge.svg",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index]["category"],
                              style: AppStyles.style12Medium.copyWith(
                                color: AppColors.color7A6E6B,
                              ),
                            ),

                            Text(
                              products[index]["product_name"],
                              style: AppStyles.style14SemiBold.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),

                            Row(
                              children: [
                                Text(
                                  "\$${products[index]["price"]}",
                                  style: AppStyles.style12Regular.copyWith(
                                    color: AppColors.color7A6E6B,
                                  ),
                                ),
                                Spacer(),

                                IconButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Cartscreen(),
                                    ),
                                  ),
                                  icon: SvgPicture.asset(
                                    "assets/icons/Button.svg",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
