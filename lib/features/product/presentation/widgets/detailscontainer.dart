import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/product/presentation/cubits/get_reviews_cubit.dart';
import 'package:nti_final_project/features/product/presentation/cubits/get_reviews_state.dart';
import 'package:nti_final_project/features/product/presentation/cubits/post_review_cubit.dart';
import 'package:nti_final_project/features/product/presentation/widgets/review_dialog.dart';
import 'package:nti_final_project/features/product/presentation/widgets/reviewsection.dart';

class Detailscontainer extends StatelessWidget {
  final String productname;
  final String productprice;
  final String productdescription;
  final String productId;

  const Detailscontainer({
    super.key,
    required this.productname,
    required this.productprice,
    required this.productdescription,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
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
                    // color: AppColors.primaryColor,
                  ),
                ),
              ),
              Text(
                "$productprice EGP",
                style: AppStyles.style20SemiBold,
                // .copyWith(
                //   color: AppColors.blackColor,
                // ),
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
                  // color: AppColors.color7A6E6B,
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 16),

          Text(
            "Description",
            style: AppStyles.style16Bold.copyWith(
              // color: AppColors.primaryColor,
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
                    // color: AppColors.primaryColor,
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
              // color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 6),

          SizedBox(height: 12),
          BlocBuilder<ReviewsCubit, GetReviewsState>(
            builder: (context, state) {
              if (state is GetReviewsLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is GetReviewsFailureState) {
                return Text("Error...${state.error}");
              } else if (state is GetReviewsSuccessState) {
                // final List<ReviewModel> reviews = state.reviews;
                if (state.reviews.isEmpty) {
                  return const Text('No reviews found');
                }

                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "4.8",
                          style: AppStyles.style24Bold,
                          // .copyWith(
                          //   color: AppColors.blackColor,
                          // ),
                        ),
                        const SizedBox(width: 6),
                        Row(
                          children: List.generate(
                            5,
                            (index) =>
                                SvgPicture.asset("assets/icons/staricon.svg"),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          ('${state.reviews.length.toString()} Reviews'),
                          style: AppStyles.style12Medium.copyWith(
                            // color: AppColors.color7A6E6B,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        final review = state.reviews[index];
                        return Reviewsection(
                          name: review.userName,
                          date: review.createdAt.toString(),
                          comment: review.comment,
                        );
                      },
                    ),
                  ],
                );
              } else {
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(color: AppColors.blackColor),
                );
              }
            },
          ),

          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                // backgroundColor: AppColors.whiteColor,
                // side: BorderSide(color: AppColors.primaryColor, width: 1.5),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PostReviewCubit(),
                      child: ReviewDialog(productId: productId.toString()),
                    );
                  },
                );
              },
              child: Text(
                "Add your review",
                style: AppStyles.style16SemiBold,
                // .copyWith(
                //   color: AppColors.primaryColor,
                // ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
