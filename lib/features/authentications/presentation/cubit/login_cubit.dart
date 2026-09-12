import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/authentications/data/data_source/authentication_remotedata_source.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/Log_In_state.dart';

class LoginCubit extends Cubit<LogInState> {
  LoginCubit() : super(LogInInitialState());

  final AuthApi authApi = AuthApi();

  Future<void> Log_In({required String email, required String password}) async {
    
      emit(LogInLoadingState());

      await authApi
          .login(email: email, password: password)
          .then(
            onError: (error) {
              log("==========================");
              emit(LogInFailureState(error: error.toString()));
            },
            (val) {
              emit(LogInSuccessState());
            },
          );
    } 
  
}
