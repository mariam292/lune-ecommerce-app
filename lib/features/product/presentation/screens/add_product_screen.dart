import 'package:flutter/material.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/custom_text_field.dart';
import '../../../../core/app_colors.dart';
import '../../../authentications/widgets/custom_text_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _productNameController =
      TextEditingController(text: "L'Aura Satin Ribbon");
  final TextEditingController _descriptionController =
      TextEditingController(text: "Luxurious satin hair ribbon to wrap or bow your styling.");
  final TextEditingController _categoryController =
      TextEditingController(text: "Hair Accessories");
  final TextEditingController _priceController =
      TextEditingController(text: "\$32.00");
  final TextEditingController _stockController =
      TextEditingController(text: "150");

  @override
  void dispose() {
    _productNameController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar: Back Button & Title
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.colorEADFD8, width: 1),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: AppColors.blackColor),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Add New Product',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Add Photos Box
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primaryColor.withValues(alpha: 0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.primaryColor,
                        size: 28,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Add Photos',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Product Name
                CustomTextField(
                  label: 'PRODUCT NAME',
                  hintText: "e.g. L'Aura Satin Ribbon",
                  controller: _productNameController,
                ),
                const SizedBox(height: 16),

                // Description
                CustomTextField(
                  label: 'DESCRIPTION',
                  hintText: "Enter product description...",
                  controller: _descriptionController,
                ),
                const SizedBox(height: 16),

                // Category
                CustomTextField(
                  label: 'CATEGORY',
                  hintText: "Select category",
                  controller: _categoryController,
                ),
                const SizedBox(height: 16),

                // Price and Stock in a Row
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'PRICE',
                        hintText: "\$0.00",
                        controller: _priceController,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextField(
                        label: 'STOCK',
                        hintText: "0",
                        controller: _stockController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                // Publish Product Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: const Text(
                      'Publish Product',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}