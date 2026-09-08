import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  final Dio dio = Dio();

  Future<void> validateOtp({
    required String email,
    required String otp,
  }) async {
    emit(OtpLoading());

    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/validate-otp',
        data: {
          'email': email,
          'otp': otp,
        },
      );

      if (response.statusCode == 200) {
        emit(OtpSuccess());
      } else {
        emit(OtpError('Invalid OTP'));
      }
    } on DioException catch (e) {
      emit(
        OtpError(
          e.response?.data?['message'] ?? 'Something went wrong',
        ),
      );
    } catch (e) {
      emit(OtpError('Something went wrong'));
    }
  }

  Future<void> resendOtp({
    required String email,
  }) async {
    emit(OtpLoading());

    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/resend-otp',
        data: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        emit(OtpSuccess());
      } else {
        emit(OtpError('Failed to resend OTP'));
      }
    } on DioException catch (e) {
      emit(
        OtpError(
          e.response?.data?['message'] ?? 'Something went wrong',
        ),
      );
    } catch (e) {
      emit(OtpError('Something went wrong'));
    }
  }
}