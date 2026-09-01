import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  const Customappbar({super.key, this.onBackPressed, this.onCartPressed});
  final VoidCallback? onBackPressed;
  final VoidCallback? onCartPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backGroundColor,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/arrow_left.svg"),
        onPressed: onBackPressed,
      ),
      centerTitle: true,
      title: Text(
        "LUNE",
        style: AppStyles.style24Bold.copyWith(color: AppColors.primaryColor),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart_bag.svg"),
          onPressed: onCartPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
