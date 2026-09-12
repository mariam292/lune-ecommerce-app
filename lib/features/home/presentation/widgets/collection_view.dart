import 'package:flutter/material.dart';
import 'package:nti_final_project/Main_Screen.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/category/presentation/screens/category_screen.dart';

class CollectionView extends StatelessWidget {
  const CollectionView({super.key, required this.img, required this.name});
  final String img;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,

      children: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainScreen(index: 1,)),
          ),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                img,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image_not_supported);
                },
              ),
            ),
            radius: 32,
          ),
        ),
        Text(
          name,
          style: AppStyles.style12Medium.copyWith(color: AppColors.blackColor),
        ),
      ],
    );
  }
}
