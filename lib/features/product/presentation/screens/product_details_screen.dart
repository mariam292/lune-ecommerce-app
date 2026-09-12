import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/features/home/data/models/product_model.dart';
import 'package:nti_final_project/features/product/presentation/cubits/get_reviews_cubit.dart';
import 'package:nti_final_project/features/product/presentation/widgets/addtocart.dart';
import 'package:nti_final_project/features/product/presentation/widgets/detailscontainer.dart';

class Productdetailsscreen extends StatefulWidget {
  const Productdetailsscreen({super.key, required this.product});
  final ProductModel product;

  @override
  State<Productdetailsscreen> createState() => _ProductdetailsscreenState();
}

class _ProductdetailsscreenState extends State<Productdetailsscreen> {
  final Dio dio = Dio();
  @override
  void initState() {
    super.initState();
    context.read<ReviewsCubit>().getReviews(productId: widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Image.network(
                            widget.product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 15,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: SvgPicture.asset(
                              "assets/icons/back-circle.svg",
                              width: 50,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                      child: Detailscontainer(
                        productname: widget.product.name,
                        productprice: widget.product.price.toString(),
                        productdescription: widget.product.description,
                        productId: widget.product.id,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Addtocartsection(productId: widget.product.id.toString()),
          ],
        ),
      ),
    );
  }
}
