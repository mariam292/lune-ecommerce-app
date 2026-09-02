import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/category/presentation/screens/category_screen.dart';

import 'package:nti_final_project/features/home/presentation/widgets/collection_view.dart';
import 'package:nti_final_project/features/product/presentation/screens/product_details_screen.dart';

class Collection extends StatelessWidget {
  Collection({super.key});

  List<CollectionView> collection = [
    CollectionView(img: "assets/images/cat1.png", name: "Jewelry"),

    CollectionView(img: "assets/images/cat2.png", name: "Bags"),
    CollectionView(img: "assets/images/cat3.png", name: "Scarves"),
    CollectionView(img: "assets/images/cat4.png", name: "Watches"),

    CollectionView(img: "assets/images/cat5.png", name: "Sunglasses"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Categories",
              style: AppStyles.style20SemiBold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryScreen()),
              ),
              child: Text(
                "View All",
                style: AppStyles.style14Medium.copyWith(
                  color: AppColors.colorA7736D,
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: 100,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,

            separatorBuilder: (context, index) {
              return SizedBox(width: 12);
            },

            itemCount: collection.length,

            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Productdetailsscreen(),
                  ),
                ),
                child: CollectionView(
                  img: collection[index].img,
                  name: collection[index].name,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
