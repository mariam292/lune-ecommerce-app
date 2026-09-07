import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/cart/presentation/screens/cart_screen.dart';
import 'package:nti_final_project/features/home/presentation/cubits/cart_cubit.dart';
import 'package:nti_final_project/features/home/presentation/cubits/cart_states.dart';
import 'package:nti_final_project/features/home/presentation/cubits/products_cubit.dart';
import 'package:nti_final_project/features/home/presentation/cubits/products_state.dart';
import 'package:nti_final_project/features/product/presentation/screens/product_details_screen.dart';

class ProductsView extends StatefulWidget {
  ProductsView({super.key, required this.sectionText});
  final sectionText;

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  List products = [];
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.sectionText,
              style: AppStyles.style20SemiBold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: onPressed,
              child: Text(
                "See More",
                style: AppStyles.style14Medium.copyWith(
                  color: AppColors.colorA7736D,
                ),
              ),
            ),
          ],
        ),

        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductsFailureState) {
              return Text("Error..............");
            } else if (state is ProductsSuccessState)
              products = state.products;
            {
              return SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 300,
                    mainAxisSpacing: 10
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,

                  itemBuilder: (context, index) {
                    return Column(
                      spacing: 5,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Productdetailsscreen(),
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 190,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),

                                    image: DecorationImage(
                                      image: NetworkImage(
                                        products[index]["coverPictureUrl"],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                left: 140,
                                right: 0,
                                top: 0,
                                bottom: 150,

                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    "assets/icons/LikeBadge.svg",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[index]["categories"][0],
                                    style: AppStyles.style12Medium.copyWith(
                                      color: AppColors.color7A6E6B,
                                    ), 
                                  ),

                                  Text(
                                    products[index]["name"],
                                    style: AppStyles.style14SemiBold.copyWith(
                                      color: AppColors.primaryColor,
                                    ),maxLines: 1,overflow: TextOverflow.ellipsis,
                                  ),

                                  Row(
                                    children: [
                                      Text(
                                        "\$${products[index]["price"]}",
                                        style: AppStyles.style12Regular
                                            .copyWith(
                                              color: AppColors.color7A6E6B,
                                            ),
                                      ),
                                      Spacer(),

                                      IconButton(
                                        onPressed: () {
                                          context
                                              .read<AddToCartCubit>()
                                              .addcartproducts(
                                                product_id:
                                                    products[index]["id"] ,
                                              );

                                          BlocListener<
                                            AddToCartCubit,
                                            AddToCartState
                                          >(
                                            listener: (context, state) {
                                              if (state
                                                  is AddToCartitemsLoadingState) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  ),
                                                );
                                              } else if (state
                                                  is AddToCartitemsSuccessState) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Cartscreen(),
                                                  ),
                                                );
                                              } else if (state
                                                  is AddToCartitemsFailureState) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      "invalid Item",
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        },
                                        icon: SvgPicture.asset(
                                          "assets/icons/Button.svg",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
