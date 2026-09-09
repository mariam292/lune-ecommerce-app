import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/category/presentation/widgets/category_item.dart';
import 'package:nti_final_project/features/category/presentation/widgets/category_top_bar.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_cubit.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_states.dart';
import '../../../../core/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SafeArea(
          child: Column(
            children: [
              CategoryTopBar(),

              Expanded(
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is CategoryFailureState) {
                      return Center(child: Text(state.error));
                    }

                    if (state is CategorySuccessState) {
                      final categories = state.category;

                      return GridView.builder(
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

                          return CategoryItem(
                            pictureUrl: category['coverPictureUrl'],
                            categoryName: category['name'],
                          );
                        },
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
