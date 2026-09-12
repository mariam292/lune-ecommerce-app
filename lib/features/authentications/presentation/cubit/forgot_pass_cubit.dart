import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/authentications/data/data_source/forgot_pass_remote_data_source.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  ForgotPassCubit() : super(ForgotPassInitialState());

  final ForgotPassRemoteDataSource forgotPassRemoteDataSource =
      ForgotPassRemoteDataSource();

  Future<void> postEmailData(String email) async {
    try {
      emit(ForgotPassLoadingState());
      await forgotPassRemoteDataSource.forgotPassData(email: email);

      emit(ForgotPassSuccessState());
    } catch (e) {
      emit(ForgotPassFailureState(error: 'faild'));
    }
  }
}
