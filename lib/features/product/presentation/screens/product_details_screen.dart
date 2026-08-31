import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/features/product/presentation/widgets/addtocart.dart';
import 'package:nti_final_project/features/product/presentation/widgets/detailscontainer.dart';


class Productdetailsscreen extends StatelessWidget {
  const Productdetailsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 400,
                          width: double.infinity,
                          color: AppColors.whiteColor,
                          child: Image.asset(
                            'assets/images/productdetails.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 15,
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/arrowbackfordetails.svg",
                              width: 50,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                      child: Detailscontainer(
                        productname: "Luminous Pearl Drop Necklace",
                        productprice: "450",
                        productdescription:
                            "An embodiment of understated elegance, this necklace features a single, perfectly spherical freshwater pearl suspended from a delicate 18k solid gold chain. The minimalist design allows the natural luster of the pearl to take center stage.....",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Addtocartsection(),
          ],
        ),
      ),
    );
  }
}
