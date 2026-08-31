import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/product/presentation/widgets/reviewsection.dart';

class Detailscontainer extends StatelessWidget {
  final String productname;
  final String productprice;
  final String productdescription;

  const Detailscontainer({
    super.key,
    required this.productname,
    required this.productprice,
    required this.productdescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  productname,
                  style: AppStyles.style24Medium.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Text(
                "$productprice EGP",
                style: AppStyles.style20SemiBold.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => SvgPicture.asset("assets/icons/staricon.svg"),
                ),
              ),
              SizedBox(width: 8),
              Text(
                "4.8 (124 REVIEWS)",
                style: AppStyles.style12Medium.copyWith(
                  color: AppColors.color7A6E6B,
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 16),

          Text(
            "Description",
            style: AppStyles.style16Bold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 6),
          RichText(
            text: TextSpan(
              style: AppStyles.style16Regular.copyWith(
                color: AppColors.color7A6E6B,
              ),
              children: [
                TextSpan(text: productdescription),
                TextSpan(
                  text: "Read more",
                  style: AppStyles.style16Medium.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),

          Text(
            "Reviews",
            style: AppStyles.style16Bold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                "4.8",
                style: AppStyles.style24Bold.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(width: 6),
              Row(
                children: List.generate(
                  5,
                  (index) => SvgPicture.asset("assets/icons/staricon.svg"),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "124 REVIEWS",
                style: AppStyles.style12Medium.copyWith(
                  color: AppColors.color7A6E6B,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Reviewsection(
            name: "Sophia M.",
            date: "Oct 12, 2023",
            comment:
                "Absolutely stunning piece. The pearl has a beautiful luster and the chain is delicate but sturdy.",
          ),
          const SizedBox(height: 12),
          Reviewsection(
            name: "Emma L.",
            date: "Sep 28, 2023",
            comment:
                "Absolutely stunning piece. The pearl has a beautiful luster and the chain is delicate but sturdy.",
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                side: BorderSide(color: AppColors.primaryColor, width: 1.5),
              ),
              onPressed: () {},
              child: Text(
                "Add your review",
                style: AppStyles.style16SemiBold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
