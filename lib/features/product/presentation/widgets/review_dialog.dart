import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/custom_elevated_button.dart';
import 'package:nti_final_project/features/product/presentation/cubits/post_review_cubit.dart';
import 'package:nti_final_project/features/product/presentation/cubits/post_review_state.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({super.key, required this.productId});
  final String productId;

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  final TextEditingController reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<PostReviewCubit, PostReviewState>(
      listener: (context, state) {
        if (state is PostReviewFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.primaryColor,
              content: Text(
                'failed',
                style: AppStyles.style16Bold.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          );
        } else if (state is PostReviewSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Your review submitted successfully',
                style: AppStyles.style16Bold.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          );
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: AppColors.backGroundColor,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Your Review",
                style: AppStyles.style24Regular.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 12),

              Text(
                "Share your thouhgts on this product",
                textAlign: TextAlign.center,
                style: AppStyles.style16Regular.copyWith(
                  color: AppColors.color7A6E6B,
                ),
              ),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  controller: reviewController,
                  decoration: InputDecoration(
                    hintText: 'Write your review here...',
                    hintStyle: AppStyles.style14Light.copyWith(
                      color: AppColors.color7A6E6B,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: AppColors.colorEADFD8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: Elevatedbutton(
                  buttontext: 'Submit Review',
                  btntextstyle: AppStyles.style16SemiBold.copyWith(
                    color: AppColors.whiteColor,
                  ),
                  buttoncolor: AppColors.primaryColor,
                  onpressed: () {
                    context.read<PostReviewCubit>().postReviewData(
                      widget.productId,
                      reviewController.text,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
