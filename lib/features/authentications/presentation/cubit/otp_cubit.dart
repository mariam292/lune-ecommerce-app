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
        emit(OtpVerified());
      } else {
        emit(OtpError('Invalid OTP'));
      }
    } on DioException catch (e) {
      final data = e.response?.data;

      if (data is Map && data['message'] != null) {
        emit(OtpError(data['message'].toString()));
      } else {
        emit(OtpError('Invalid OTP'));
      }
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
        emit(OtpResendSuccess());
      } else {
        emit(OtpError('Failed to resend OTP'));
      }
    } on DioException catch (e) {
      final data = e.response?.data;

      if (data is Map && data['message'] != null) {
        emit(OtpError(data['message'].toString()));
      } else {
        emit(OtpError('Failed to resend OTP'));
      }
    } catch (e) {
      emit(OtpError('Something went wrong'));
    }
  }
}
