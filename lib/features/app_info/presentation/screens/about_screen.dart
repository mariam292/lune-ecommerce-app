import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'app_colors.dart';
import 'AppFonts.dart';

class AboutUs extends StatelessWidget
{
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return  

    Scaffold(
appBar: AppBar(

leading:IconButton(onPressed:  (){}, icon: SvgPicture.asset("assets/icons/arrow_back.svg")) ,

title:Text("LUNÉ",style:  AppStyles.style36Regular.copyWith(color: AppColors.primaryColor,fontFamily:'Instrument Serif')),

centerTitle: true,

actions: [IconButton(onPressed:  (){}, icon: SvgPicture.asset("assets/icons/Button - Shopping bag.svg")) ,],

 

),backgroundColor:AppColors.backGroundColor,
body:

SafeArea(child:  

 Padding(
   padding: const EdgeInsets.all(24.0),
   
   child:  SingleChildScrollView(
     child: Column(
      spacing:50 ,
      crossAxisAlignment: CrossAxisAlignment.center,
       children: [
     
     Center(
       child: Text("Our Story",style:  AppStyles.style28SemiBold.copyWith(color: AppColors.primaryColor,
       fontFamily:'play fair display')),
     ),
     
     Image.asset("assets/images/Background.png"),
     
     
     
      Container(
       width: double.infinity,
       height: 156,
     child: Text("""A legacy of light, sculpted into form. Every
    piece of LUNA jewelry is born from a
dialogue between raw materials and refined
         skill. Our ateliers marry traditional
craftsmanship with contemporary design to
     create heirlooms for the modern era.""",style:  AppStyles.style12Medium.copyWith(color:AppColors.blackColor,fontFamily: 'poppins')),
      ),
     
     
     
     Column(children: [
     
      Text("Eleanor Vance",style:  AppStyles.style36Regular.copyWith(color: AppColors.primaryColor,fontFamily: 'great vibes'))
     ,
         Text("FOUNDER & CREATIVE DIRECTOR",style:  AppStyles.style12Medium.copyWith(color: AppColors.color7A6E6B,fontFamily: 'poppins'))
     
     ,
     
     
     ],)
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
       ],
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     ),
   ),
 )




























)



























    );

























  }




  
}
