import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/Main_Screen.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/custom_elevated_button.dart';
import 'package:nti_final_project/features/cart/presentation/cubits/quantity_cubit.dart';
import 'package:nti_final_project/features/cart/presentation/screens/cart_screen.dart';
import 'package:nti_final_project/features/product/presentation/cubits/delete_product_cubit.dart';
import 'package:nti_final_project/features/product/presentation/widgets/showdelete.dart';

class Addtocartsection extends StatelessWidget {
  const Addtocartsection({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => DeleteProductCubit(),
                    child: Showdelete(productId: productId),
                  );
                },
              );
            },
            icon: Icon(
              Icons.delete_outline,
              color: AppColors.primaryColor,
              size: 26,
            ),
          ),
          SizedBox(width: 8),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.backGroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.remove,
                    size: 16,
                    color: AppColors.color7A6E6B,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.add,
                    size: 16,
                    color: AppColors.color7A6E6B,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Elevatedbutton(
              buttontext: 'ADD TO CART',
              btntextstyle: AppStyles.style14SemiBold.copyWith(
                color: AppColors.whiteColor,
              ),
              buttoncolor: AppColors.primaryColor,
              onpressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen(index: 2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
