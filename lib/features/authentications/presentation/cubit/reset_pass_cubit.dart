import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/authentications/data/data_source/reset_pass_data_source.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit() : super(ResetPassInitialState());

  final ResetPassDataSource resetPassDataSource = ResetPassDataSource();

  Future<void> postNewPassData({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      emit(ResetPassLoadingState());
      await resetPassDataSource.resetPassData(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );

      emit(ResetPassSuccesState());
    } catch (e) {
      emit(ResetPassFailureState(error: 'faild'));
    }
  }
}
