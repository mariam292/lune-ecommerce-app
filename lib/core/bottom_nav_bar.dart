import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lune/app_colors.dart';


class  BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int current_index=0  ;
 @override
  Widget build(BuildContext context) {
   return     BottomNavigationBar (
    type: BottomNavigationBarType.shifting,
    currentIndex:current_index
    ,selectedItemColor: AppColors.primaryColor,
    backgroundColor: AppColors.whiteColor,
      
      unselectedItemColor: AppColors.blackColor,
    onTap: (value) {
      
      setState(() {
        current_index=value;
      });
    },
    items: 
    [ BottomNavigationBarItem(icon:SvgPicture.asset("assets/icons/home (6).svg",color:current_index==0 ? AppColors.primaryColor:AppColors.blackColor,),label:" "),
      BottomNavigationBarItem(icon:SvgPicture.asset("assets/icons/grid.svg",color: current_index==1 ? AppColors.primaryColor:AppColors.blackColor,),label: ""),
      BottomNavigationBarItem(icon:SvgPicture.asset("assets/icons/Vector (1).svg",color: current_index==2 ? AppColors.primaryColor:AppColors.blackColor,),label: " "),
      BottomNavigationBarItem(icon:SvgPicture.asset("assets/icons/user.svg",color: current_index==3 ? AppColors.primaryColor:AppColors.blackColor,),label: " "),
    ]
     )  ;

 
    
  }
}
