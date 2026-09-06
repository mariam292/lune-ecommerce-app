import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/bottom_nav_bar.dart';
import 'package:nti_final_project/core/common_widgets/elevatedbutton.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/custom_text_field.dart';
import 'package:nti_final_project/features/home/presentation/screens/home_screen.dart';
import 'package:nti_final_project/features/product/presentation/add_product_cubit/add_product_cuibt.dart';
import 'package:nti_final_project/features/product/presentation/add_product_cubit/add_product_states.dart';
import '../../../../core/app_colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    priceController.dispose();
    stockController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SvgPicture.asset('assets/icons/back-circle.svg'),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Add New Product',
                      style: AppStyles.style24Regular.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primaryColor.withValues(alpha: 0.5),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.primaryColor,
                          size: 28,
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Add Photos',
                          style: AppStyles.style12Medium.copyWith(
                            color: AppColors.colorA7736D,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                CustomTextField(
                  label: "Product Title",
                  hintText: "e.g. L'Aura Satin Ribbon",
                  controller: titleController,
                ),

                SizedBox(height: 16),

                CustomTextField(
                  label: "Description",
                  hintText: "Enter product description...",
                  controller: descriptionController,
                ),

                SizedBox(height: 16),

                CustomTextField(
                  label: "Category GUID",
                  hintText: "Select or enter category ID",
                  controller: categoryController,
                ),

                SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: "Price",
                        hintText: "0.00",
                        controller: priceController,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: CustomTextField(
                        label: "Stock",
                        hintText: "0",
                        controller: stockController,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                BlocConsumer<AddProductCuibt, AddProductState>(
                  listener: (context, state) {
                    if (state is AddProductFaliureState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Failed To Add The Product..."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (state is AddProductSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Product Added Successfully..."),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AddProductLodingState) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return Elevatedbutton(
                      buttontext: 'Add Product',
                      btntextstyle: AppStyles.style16SemiBold.copyWith(
                        color: AppColors.whiteColor,
                      ),
                      buttoncolor: AppColors.primaryColor,
                      onpressed: () {
                        context.read<AddProductCuibt>().addProduct(
                          name: titleController.text,
                          description: descriptionController.text,
                          price: double.tryParse(priceController.text) ?? 0.0,
                          categoryid: categoryController.text,
                          stock: int.tryParse(stockController.text) ?? 0,
                          imageurl: imageController.text,
                        );
                      },
                    );
                  },
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
