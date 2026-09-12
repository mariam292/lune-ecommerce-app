import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/features/category/presentation/widgets/category_item.dart';
import 'package:nti_final_project/features/category/presentation/widgets/category_top_bar.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_cubit.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_nour_states.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryNourCubit()..get_categoryNour(),
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SafeArea(
          child: Column(
            children: [
              const CategoryTopBar(),

              Expanded(
                child: BlocBuilder<CategoryNourCubit, CategorNouryState>(
                  builder: (context, state) {
                    if (state is CategoryNourLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is CategoryNourFailureState) {
                      return Center(
                        child: Text(state.error, textAlign: TextAlign.center),
                      );
                    }

                    if (state is CategoryNourSuccessState) {
                      final categories = state.categoryNour;

                      if (categories.isEmpty) {
                        return const Center(child: Text('No Categories Found'));
                      }

                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: GridView.builder(
                          itemCount: categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 167 / 155,
                              ),
                          itemBuilder: (context, index) {
                            final category = categories[index];

                            final String name =
                                category['name']?.toString() ?? 'Category';

                            final String pictureUrl =
                                category['coverPictureUrl']?.toString() ?? '';

                            return CategoryItem(
                              pictureUrl: pictureUrl,
                              categoryName: name,
                            );
                          },
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
