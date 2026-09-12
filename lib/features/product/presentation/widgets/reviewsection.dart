import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class Reviewsection extends StatelessWidget {
  const Reviewsection({
    super.key,
    required this.name,
    required this.date,
    required this.comment,
  });
  final String name, date, comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: List.generate(
            //     5,
            //     (index) => SvgPicture.asset("assets/icons/staricon.svg"),
            //   ),
            // ),
            const SizedBox(height: 2),
            Text(
              name,
              style: AppStyles.style16Regular.copyWith(
                // color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              comment,
              style: AppStyles.style14Regular.copyWith(
                // color: AppColors.color7A6E6B,
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                date,
                style: AppStyles.style16Regular.copyWith(
                  // color: AppColors.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
