import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/Main_Screen.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:nti_final_project/features/cart/presentation/cubits/cart_states.dart';
import 'package:nti_final_project/core/common_widgets/custom_elevated_button.dart';
import 'package:nti_final_project/features/cart/presentation/widgets/cartitem.dart';
import 'package:nti_final_project/features/cart/presentation/widgets/customsummaryitem.dart';
import 'package:nti_final_project/features/cart/presentation/widgets/promocode.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getcart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            "assets/icons/back-circle.svg",
            width: 50,
            height: 50,
          ),
        ),
        title: Text(
          "My Cart",
          style: AppStyles.style24SemiBold.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/ring-action.svg",
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),

                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is GetCartFailureState) {
                      return Text("Error");
                    }

                    if (state is GetCartSuccessState) {
                      final mycart = state.productcart;

                      //price calc section(عدوهاااااا)
                      double subtotal = 0;
                      double totalPrice = 0;

                      for (int index = 0; index < mycart.length; index++) {
                        final quantity =
                            num.tryParse(
                              mycart[index]["quantity"].toString(),
                            ) ??
                            0;

                        final basePrice =
                            num.tryParse(
                              mycart[index]["basePricePerUnit"].toString(),
                            ) ??
                            0;

                        final itemTotalPrice =
                            num.tryParse(
                              mycart[index]["totalPrice"].toString(),
                            ) ??
                            0;

                        subtotal += basePrice * quantity;

                        totalPrice += itemTotalPrice;
                      }

                      final discount = subtotal - totalPrice;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: mycart.length,
                            itemBuilder: (context, index) {
                              return CartItem(
                                imagePath: mycart[index]["productCoverUrl"],
                                productName: mycart[index]["productName"],
                                productPrice: mycart[index]["finalPricePerUnit"]
                                    .toString(),
                              );
                            },
                          ),

                          SizedBox(height: 15),

                          PromoCodeSection(),

                          SizedBox(height: 25),

                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  CustomSummaryItem(
                                    title: 'Subtotal',
                                    price: '${subtotal.toString()} EGP',
                                    pricecolor: AppColors.blackColor,
                                  ),

                                  CustomSummaryItem(
                                    title: 'Shipping',
                                    price: 'Free',
                                    pricecolor: AppColors.blackColor,
                                  ),

                                  CustomSummaryItem(
                                    title: 'Discount',
                                    price: '-${discount.toString()} EGP',
                                    pricecolor: AppColors.colorA66860,
                                  ),

                                  const Divider(),

                                  Row(
                                    children: [
                                      Text(
                                        'Total',
                                        style: AppStyles.style20Bold,
                                      ),
                                      const Spacer(),
                                      Text(
                                        '${totalPrice.toString()} EGP',
                                        style: AppStyles.style20Bold,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 30),

                          Elevatedbutton(
                            buttontext: 'Proceed to Checkout',
                            btntextstyle: AppStyles.style16SemiBold.copyWith(
                              color: AppColors.whiteColor,
                            ),
                            buttoncolor: AppColors.primaryColor,
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }

                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
