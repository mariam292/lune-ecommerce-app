import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/bottom_nav_bar.dart';
import 'package:nti_final_project/core/common_widgets/elevatedbutton.dart';
import 'package:nti_final_project/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:nti_final_project/features/cart/presentation/cubits/cart_states.dart';
import 'package:nti_final_project/features/cart/presentation/widgets/cartitem.dart';
import 'package:nti_final_project/features/cart/presentation/widgets/customsummaryitem.dart';
import 'package:nti_final_project/features/cart/presentation/widgets/promocode.dart';
import 'package:nti_final_project/features/home/presentation/screens/home_screen.dart';

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
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
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
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 10),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is GetCartFailureState) {
                      return Text("Erorrrrrrrr");
                    } else if (state is GetCartSuccessState) {
                      final mycart = state.productcart;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
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
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                SizedBox(height: 15),
                //promo code section
                PromoCodeSection(),
                SizedBox(height: 25),

                //Summary section
                Card(
                  color: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: AppColors.colorEADFD8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        CustomSummaryItem(
                          title: 'Subtotal',
                          price: '190.00 EGP',
                          pricecolor: AppColors.blackColor,
                        ),
                        CustomSummaryItem(
                          title: 'Shipping',
                          price: 'Free',
                          pricecolor: AppColors.blackColor,
                        ),
                        CustomSummaryItem(
                          title: 'Discount',
                          price: '-0.00 EGP',
                          pricecolor: AppColors.colorA66860,
                        ),
                        Divider(),
                        Row(
                          children: [
                            Text(
                              'Total',
                              style: AppStyles.style20Bold.copyWith(
                                color: AppColors.blackColor,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '420 EGP',
                              style: AppStyles.style20Bold.copyWith(
                                color: AppColors.blackColor,
                              ),
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
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
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
