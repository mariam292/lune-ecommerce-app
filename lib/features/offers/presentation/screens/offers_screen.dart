import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/bottom_nav_bar.dart';
import 'package:nti_final_project/features/offers/presentation/cubits/offers_cubit.dart';
import 'package:nti_final_project/features/offers/presentation/cubits/offers_states.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OffersCubit()..getoffers(),
      child: Scaffold(
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
            " Offers",
            style: AppStyles.style24SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  BlocBuilder<OffersCubit, OffersState>(
                    builder: (context, state) {
                      if (state is OffersFaliureState) {
                        return Center(child: Text("NO Offers Avalible Now"));
                      } else if (state is OffersSuccessState) {
                        final myoffers = state.myoffers;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Your Offers",
                                  style: AppStyles.style20SemiBold.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),

                            SizedBox(
                              width: double.infinity,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisExtent: 300,
                                    ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),

                                itemCount: myoffers.length,

                                itemBuilder: (context, index) {
                                  return Column(
                                    spacing: 10,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 190,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    "https://cdn.phototourl.com/free/2026-09-08-95efef8b-b53a-456f-a255-6f2208d2b4d2.png",
                                                    // myoffers[index]["coverUrl"],
                                                  ),
                                                  fit: BoxFit.cover,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  myoffers[index]["name"],
                                                  style: AppStyles
                                                      .style14SemiBold
                                                      .copyWith(
                                                        color: AppColors
                                                            .primaryColor,
                                                      ),
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      "200 EGP",
                                                      style: AppStyles
                                                          .style12Regular
                                                          .copyWith(
                                                            color: AppColors
                                                                .color7A6E6B,
                                                          ),
                                                    ),

                                                    Spacer(),

                                                    IconButton(
                                                      onPressed: () {},
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
      ),
    );
  }
}
