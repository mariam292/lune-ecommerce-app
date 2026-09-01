import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/features/cart/presentation/screens/cart_screen.dart';
import 'package:nti_final_project/features/category/presentation/screens/category_screen.dart';
import 'package:nti_final_project/features/home/presentation/screens/home_screen.dart';
import 'package:nti_final_project/features/profile/presentation/screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: current_index,
      selectedItemColor: AppColors.primaryColor,
      backgroundColor: AppColors.whiteColor,

      unselectedItemColor: AppColors.blackColor,
      onTap: (value) {
        setState(() {
          current_index = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.home_filled,
              color: current_index == 0
                  ? AppColors.primaryColor
                  : AppColors.blackColor,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ),
          ),
          label: " ",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.grid_4x4_sharp,
              color: current_index == 1
                  ? AppColors.primaryColor
                  : AppColors.blackColor,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryScreen()),
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.card_travel,
              color: current_index == 2
                  ? AppColors.primaryColor
                  : AppColors.blackColor,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cartscreen()),
            ),
          ),
          label: " ",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.person),
            color: current_index == 3
                ? AppColors.primaryColor
                : AppColors.blackColor,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            ),
          ),
          label: " ",
        ),
      ],
    );
  }
}
