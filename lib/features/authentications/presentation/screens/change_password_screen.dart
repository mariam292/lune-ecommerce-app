import 'package:flutter/material.dart';
import 'package:nti_final_project/features/authentications/data/data_source/authentication_remotedata_source.dart';
import '../widgets/custom_text_field.dart';
import '../../../../core/app_colors.dart';
 
import 'forgot_password_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final AuthApi authApi = AuthApi();

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isCurrentPasswordHidden = true;
  bool _isNewPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> changePassword() async {
    if (_currentPasswordController.text.isEmpty ||
        _newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );
      return;
    }

    if (_newPasswordController.text !=
        _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await authApi.changePassword(
        currentPassword: _currentPasswordController.text,
        newPassword: _newPasswordController.text,
        confirmNewPassword: _confirmPasswordController.text,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password changed successfully'),
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to change password'),
        ),
      );
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 18,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Enter New Password Details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        label: 'CURRENT PASSWORD',
                        controller: _currentPasswordController,
                        hintText: '••••••••••••',
                        isPassword: true,
                        isPasswordHidden: _isCurrentPasswordHidden,
                        onSuffixTap: () {
                          setState(() {
                            _isCurrentPasswordHidden =
                                !_isCurrentPasswordHidden;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'NEW PASSWORD',
                        controller: _newPasswordController,
                        hintText: '••••••••••••',
                        isPassword: true,
                        isPasswordHidden: _isNewPasswordHidden,
                        onSuffixTap: () {
                          setState(() {
                            _isNewPasswordHidden =
                                !_isNewPasswordHidden;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'CONFIRM NEW PASSWORD',
                        controller: _confirmPasswordController,
                        hintText: '••••••••••••',
                        isPassword: true,
                        isPasswordHidden: _isConfirmPasswordHidden,
                        onSuffixTap: () {
                          setState(() {
                            _isConfirmPasswordHidden =
                                !_isConfirmPasswordHidden;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed:
                              _isLoading ? null : changePassword,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'update password',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPassword(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}