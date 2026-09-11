import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/Main_Screen.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/category/presentation/screens/category_screen.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_cubit.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_states.dart';

import 'package:nti_final_project/features/home/presentation/widgets/collection_view.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  List collection = [];
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
                MaterialPageRoute(builder: (context) =>  MainScreen(index:1)),
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

        BlocConsumer<CategoryCubit, CategoryState>(
          listener: (context, state) {
            if (state is CategoryFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error.toString()),
                  backgroundColor: AppColors.primaryColor,
                ),
              );
            }
          },

          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoryFailureState) {
              return Text("Error...............");
            } else if (state is CategorySuccessState) {
              collection = state.category;
              return SizedBox(
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
                          builder: (context) =>  MainScreen(index:1),
                        ),
                      ),
                      child: CollectionView(
                        img: collection[index]["coverPictureUrl"],
                        name: collection[index]["name"],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(child: Text("Data Error"));
            }
            // },
          },
        ),
      ],
    );
  }
}
