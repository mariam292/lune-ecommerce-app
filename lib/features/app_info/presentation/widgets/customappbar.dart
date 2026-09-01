import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/cart/presentation/screens/cart_screen.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backGroundColor,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/arrow_left.svg"),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: Text(
        "LUNE",
        style: AppStyles.style24Bold.copyWith(color: AppColors.primaryColor),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart_bag.svg"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cartscreen()),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
