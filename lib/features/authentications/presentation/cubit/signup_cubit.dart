import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      emit(SignupError("Please fill in all fields"));
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

    final fullName = name.split(RegExp(r'\s+'));

    final firstName = fullName.first;

    final lastName =
        fullName.length > 1 ? fullName.sublist(1).join(' ') : '';

    emit(SignupLoading());

    try {
      final dio = Dio();

      final response = await dio.post(
        "https://accessories-eshop.runasp.net/api/auth/register",
        data: {
          "email": email,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
        },
      );

      print(response.data);

      emit(SignupSuccess());
    } on DioException catch (e) {
      String message = "Registration failed";

      if (e.response?.data is Map) {
        final data = e.response?.data as Map;

        if (data["message"] != null) {
          message = data["message"].toString();
        } else if (data["errors"] != null) {
          message = data["errors"].toString();
        }
      }

      emit(SignupError(message));
    } catch (e) {
      emit(SignupError("Something went wrong"));
    }
  }
}
