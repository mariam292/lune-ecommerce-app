 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lune/app_colors.dart';
import 'package:lune/app_text_style.dart';
import 'package:lune/bottom_nav_bar.dart';
import 'package:lune/collections.dart';
import 'package:lune/featured_picks.dart';
import 'package:lune/new_arraival.dart';
import 'package:lune/product_search.dart';
import 'package:lune/seasonal_exclusive_offer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar:BottomNavBar() ,
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
                      style: AppStyles.style26Regular.copyWith(
                        color: AppColors.primaryColor,
                        fontFamily: 'Instrument Serif',
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/Vector.svg"),
                      padding: EdgeInsets.all(0),
                      alignment: Alignment(1.5, 0),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/CartBadge.svg"),
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        alignment: Alignment(1.3, -0.5),
                      ),
                    ),
                  ],
                ),
                ProductSearch(),
                SeasonalOffers(),
                Collection(),

                FeaturedPicks(),
                NewArraival(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
