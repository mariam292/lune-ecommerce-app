import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:nti_final_project/features/cart/presentation/screens/cart_screen.dart';
import 'package:nti_final_project/features/category/presentation/screens/category_screen.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_cubit.dart';
import 'package:nti_final_project/features/home/presentation/cubits/products_cubit.dart';
import 'package:nti_final_project/features/home/presentation/screens/home_screen.dart';
import 'package:nti_final_project/features/profile/presentation/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key, this.index = 0});
  int? index;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var section;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.index ?? 0,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home_filled),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Categories",
            activeIcon: Icon(Icons.grid_view_rounded),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
            activeIcon: Icon(Icons.shopping_bag_rounded),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
            activeIcon: Icon(Icons.person),
          ),
        ],
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.blackColor,

        onTap: (newvalue) {
          setState(() {
            widget.index = newvalue;
          });
        },
      ),

      body: [
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CategoryCubit()),
            BlocProvider(create: (context) => ProductsCubit()),
          ],
          child: HomeScreen(),
        ),

        BlocProvider(
          create: (context) =>  CategoryCubit(),
          child: CategoryScreen(),
        ),

        BlocProvider(create: (context) => CartCubit(), child: Cartscreen()),
        ProfileScreen(),
      ][widget.index ?? 0],
    );
  }
}
