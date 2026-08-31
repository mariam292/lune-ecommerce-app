 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lune/app_colors.dart';
import 'package:lune/app_text_style.dart';

class ProductSearch extends StatefulWidget
{
  const ProductSearch({super.key});

  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  @override
  Widget build(BuildContext context) {
    return
     SizedBox(
       height: 44,
       child: TextField(
           maxLines: 1, 
       decoration: InputDecoration(
       
       hint: Text("Search accessories...",style: AppStyles.style12Regular.copyWith(color: AppColors.color7A6E6B,fontFamily: 'poppins'))
       ,
       prefixIcon: Padding(
         padding: const EdgeInsets.all(16),
         child: SvgPicture.asset('assets/icons/search.svg',),
       ),
       enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(22),borderSide:BorderSide(color: AppColors.whiteColor)),
       focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(22),borderSide:BorderSide(color: AppColors .primaryColor)),
       fillColor:  AppColors.whiteColor,
       
       filled: true
 
       ),
       
       
       
       
       
       
       
       
       
       
       
       
       
       ),
     );
  }
}
