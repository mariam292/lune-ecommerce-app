import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/custom_elevated_button.dart';
import 'package:nti_final_project/features/product/presentation/cubits/delete_product_cubit.dart';
import 'package:nti_final_project/features/product/presentation/cubits/delete_product_state.dart';

class Showdelete extends StatefulWidget {
  const Showdelete({super.key, required this.productId});
  final String productId;

  @override
  State<Showdelete> createState() => _ShowdeleteState();
}

class _ShowdeleteState extends State<Showdelete> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteProductCubit, DeleteProductState>(
      listener: (context, state) {
        if (state is DeleteProducFailureState) {
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
        } else if (state is DeleteProducSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'This product deleted successfully',
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
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.colorEADFD8,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.primaryColor,
                  size: 38,
                ),
              ),
              SizedBox(height: 20),

              Text(
                "Delete Product?",
                style: AppStyles.style24Regular.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 12),

              Text(
                "Are you sure you want to delete this product? This action cannot be undone.",
                textAlign: TextAlign.center,
                style: AppStyles.style16Regular.copyWith(
                  color: AppColors.color7A6E6B,
                ),
              ),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: Elevatedbutton(
                  buttontext: 'Delete',
                  btntextstyle: AppStyles.style16SemiBold.copyWith(
                    color: AppColors.whiteColor,
                  ),
                  buttoncolor: AppColors.primaryColor,
                  onpressed: () {
                    context.read<DeleteProductCubit>().deleteProductData(
                      widget.productId,
                    );
                  },
                ),
              ),
              SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryColor, width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Cancel",
                    style: AppStyles.style16SemiBold.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// void showDeleteDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//         backgroundColor: AppColors.backGroundColor,
//         insetPadding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: AppColors.colorEADFD8,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.warning_amber_rounded,
//                   color: AppColors.primaryColor,
//                   size: 38,
//                 ),
//               ),
//               SizedBox(height: 20),

//               Text(
//                 "Delete Product?",
//                 style: AppStyles.style24Regular.copyWith(
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//               SizedBox(height: 12),

//               Text(
//                 "Are you sure you want to delete this product? This action cannot be undone.",
//                 textAlign: TextAlign.center,
//                 style: AppStyles.style16Regular.copyWith(
//                   color: AppColors.color7A6E6B,
//                 ),
//               ),
//               SizedBox(height: 24),

//               SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child: Elevatedbutton(
//                   buttontext: 'Delete',
//                   btntextstyle: AppStyles.style16SemiBold.copyWith(
//                     color: AppColors.whiteColor,
//                   ),
//                   buttoncolor: AppColors.primaryColor, onpressed: () {  },
//                 ),
//               ),
//               SizedBox(height: 12),

//               SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child: OutlinedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(color: AppColors.primaryColor, width: 1.2),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                   child: Text(
//                     "Cancel",
//                     style: AppStyles.style16SemiBold.copyWith(
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
