import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/bottom_nav_bar.dart';
import 'package:nti_final_project/features/cart/presentation/screens/cart_screen.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_cubit.dart';
import 'package:nti_final_project/features/home/presentation/cubits/products_cubit.dart';
import 'package:nti_final_project/features/home/presentation/widgets/collections.dart';
import 'package:nti_final_project/features/home/presentation/widgets/featured_picks.dart';
import 'package:nti_final_project/features/home/presentation/widgets/product_search.dart';
import 'package:nti_final_project/features/home/presentation/widgets/seasonal_exclusive_offer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getCategory();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 17,
              children: [
                Row(
                  children: [
                    Text(
                      "LUNÉ",
                      style: AppStyles.style28Regular.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/ring-action.svg"),
                      padding: EdgeInsets.all(0),
                    ),

                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cartscreen()),
                      ),
                      icon: SvgPicture.asset("assets/icons/cart_bag.svg"),
                      style: IconButton.styleFrom(padding: EdgeInsets.all(0)),
                    ),
                  ],
                ),
                ProductSearch(),
                SeasonalOffers(),
                Collection(),

                BlocProvider(
                  create: (context) => ProductsCubit(),
                  child: FeaturedPicks(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
