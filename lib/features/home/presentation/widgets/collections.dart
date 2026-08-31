 import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lune/app_colors.dart';
import 'package:lune/AppFonts.dart';
import 'package:lune/collection_view.dart';

class Collection extends StatelessWidget
{
    Collection({super.key});
 
List<CollectionView>collection =
[
CollectionView(img:"assets/images/Ellipse.png" , name: "Jewelry"),

CollectionView(img: "assets/images/Ellipse (1).png", name: "Bags"),
CollectionView(img: "assets/images/Ellipse (2).png", name: "Scarves"),
CollectionView(img: "assets/images/Ellipse (3).png", name: "Watches"),

CollectionView(img: "assets/images/Ellipse (4).png", name: "Sunglasses"),
];



  @override
  Widget build(BuildContext context) {
     return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Row(children: [
      Text("Collections",style: 
      AppStyles.style20Regular.copyWith(color: AppColors.primaryColor,fontFamily:'Instrument Serif'),)


    ,Spacer(),
    TextButton(onPressed: (){}, child:  Text("View All",style: 
      AppStyles.style14Medium.copyWith(color: AppColors.colorA7736D,fontFamily:'Poppins'),)

 )
 
    ],),


    SizedBox(

       height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection:Axis.horizontal ,
      
      separatorBuilder:(context, index) {
        return  SizedBox(width: 12,);
      } , 
      
      
      
      itemCount:  collection.length,
      
      
      
      
      itemBuilder:  (context, index) {
        return CollectionView(img: collection[index].img, name:collection[index].name);
      },
      
      
      
      
      ),
    )














     ],);
  }



  
}
