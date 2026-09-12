import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/cart/presentation/cubits/quantity_cubit.dart';

class CartItem extends StatefulWidget {
  final String imagePath;
  final String productName;
  final String productPrice;

  const CartItem({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productPrice,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (!isVisible) {
      return const SizedBox.shrink();
    }

    return Card(
      // color: AppColors.whiteColor,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColors.color7A6E6B),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.productName,
                          style: AppStyles.style16SemiBold.copyWith(
                            // color: AppColors.blackColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = false;
                          });
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: AppColors.color7A6E6B,
                          size: 25,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.productPrice.toString()} EGP",
                        style: AppStyles.style16SemiBold.copyWith(
                          // color: AppColors.primaryColor,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.color7A6E6B),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                context.read<QuantityCubit>().decrement();
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: AppColors.color7A6E6B,
                              ),
                            ),
                            const SizedBox(width: 10),
                            BlocBuilder<QuantityCubit, int>(
                              builder: (context, state) {
                                return Text(
                                  '$state',
                                  style: AppStyles.style12SemiBold,
                                );
                              },
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                context.read<QuantityCubit>().increment();
                              },
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: AppColors.color7A6E6B,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
