import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final Dio dio = Dio();

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (firstName.trim().isEmpty) {
      emit(SignupError("First name is required"));
      return;
    }

    if (lastName.trim().isEmpty) {
      emit(SignupError("Last name is required"));
      return;
    }

    if (lastName.trim().length < 3) {
      emit(SignupError("Last name must be at least 3 characters"));
      return;
    }

    if (email.trim().isEmpty) {
      emit(SignupError("Email is required"));
      return;
    }

    if (password.isEmpty) {
      emit(SignupError("Password is required"));
      return;
    }

    if (confirmPassword.isEmpty) {
      emit(SignupError("Confirm password is required"));
      return;
    }

    if (!email.toLowerCase().endsWith("@gmail.com")) {
      emit(SignupError("Please enter a valid Gmail address"));
      return;
    }

    if (password != confirmPassword) {
      emit(SignupError("Passwords do not match"));
      return;
    }

    emit(SignupLoading());

    try {
      final response = await dio.post(
        "https://accessories-eshop.runasp.net/api/auth/register",
        data: {
          "email": email.trim(),
          "password": password,
          "firstName": firstName.trim(),
          "lastName": lastName.trim(),
        },
      );

      print("STATUS: ${response.statusCode}");
      print("DATA: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(SignupSuccess());
      } else {
        emit(SignupError("Registration failed"));
      }
    } on DioException catch (e) {
      print("STATUS: ${e.response?.statusCode}");
      print("DATA: ${e.response?.data}");
      print("MESSAGE: ${e.message}");

      String message = "Registration failed";

      final data = e.response?.data;

      if (data is Map) {
        final errors = data["errors"];

        if (errors is Map && errors.isNotEmpty) {
          final firstError = errors.values.first;

          if (firstError is List && firstError.isNotEmpty) {
            message = firstError.first.toString();
          } else {
            message = firstError.toString();
          }
        } else if (data["message"] != null) {
          message = data["message"].toString();
        }
      }

      if (e.response?.statusCode == 500 && message == "Registration failed") {
        message = "Server error. Please try again later.";
      }

      emit(SignupError(message));
    } catch (e) {
      print("ERROR: $e");
      emit(SignupError("Something went wrong"));
    }
  }
}
