import 'package:flutter/material.dart';
import 'package:lune/app_colors.dart';
import 'package:lune/AppFonts.dart';

class CollectionView extends StatelessWidget
{
  const CollectionView({super.key,required this.img,required this.name});
   final String img;
   final String name;
  @override
  Widget build(BuildContext context) {
    return Column (
      spacing: 8,
      
      children: [

CircleAvatar(

backgroundImage:  AssetImage(img),
 radius:32,
),
Text(name,style:AppStyles.style12Medium.copyWith(color: AppColors.blackColor) ,)





    ],);
  }




}


 
