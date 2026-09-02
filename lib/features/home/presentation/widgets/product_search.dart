import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class ProductSearch extends StatefulWidget {
  const ProductSearch({super.key});

  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          hint: Text(
            "Search accessories...",
            style: AppStyles.style14Regular.copyWith(
              color: AppColors.color7A6E6B,
            ),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(2),
            child: Icon(Icons.search, color: AppColors.color685D50, size: 25),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(color: AppColors.whiteColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          fillColor: AppColors.whiteColor,

          filled: true,
        ),
      ),
    );
  }
}
