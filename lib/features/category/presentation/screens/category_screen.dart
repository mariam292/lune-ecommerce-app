import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_text_style.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  final List<Map<String, String>> categories = const [
    {'name': 'Jewelry', 'image': 'assets/images/cat1.png'},
    {'name': 'Bags', 'image': 'assets/images/cat2.png'},
    {'name': 'Scarves', 'image': 'assets/images/cat3.png'},
    {'name': 'Watches', 'image': 'assets/images/cat4.png'},
    {'name': 'Sunglasses', 'image': 'assets/images/cat5.png'},
    {'name': 'Hair Accessories', 'image': 'assets/images/cat6.png'},
    {'name': 'Belts', 'image': 'assets/images/cat7.png'},
    {'name': 'Fragrance', 'image': 'assets/images/cat8.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.25,
                  ),
                  itemBuilder: (context, index) {
                    return _CategoryItem(
                      name: categories[index]['name']!,
                      image: categories[index]['image']!,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Row(
        children: [
         // IconButton(onPressed: ()=> Navigator.pop(), icon: SvgPicture.asset('assets/icons/back-circle.svg'),),
           SizedBox(width: 8),
          Text(
            'Categories',
            style: AppStyles.style20Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const Spacer(),
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 20,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.name, required this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.style12SemiBold.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
