import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/home/presentation/cubits/cart_cubit.dart';
import 'package:nti_final_project/features/home/presentation/cubits/products_cubit.dart';
import 'package:nti_final_project/features/home/presentation/widgets/products_view.dart';

class FeaturedPicks extends StatefulWidget {
  FeaturedPicks({super.key});

  @override
  State<FeaturedPicks> createState() => _FeaturedPicksState();
}

class _FeaturedPicksState extends State<FeaturedPicks> {
  @override
  void initstate() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartCubit(),
      child: ProductsView(sectionText: "Products"),
    );
  }
}
