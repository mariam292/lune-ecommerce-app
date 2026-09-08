import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/offers/data/data_source/remote_data_source.dart';
import 'package:nti_final_project/features/offers/presentation/cubits/offers_states.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitialState());
  final OffersRemoteDataSource offersRemoteDataSource =
      OffersRemoteDataSource();

  Future<void> getoffers() async {
    emit(OffersLoadingState());
    await offersRemoteDataSource.getoffers().then(
      onError: (error) {
        emit(OffersFaliureState(errormessage: error));
        log("Cuibt Error:$error");
      },
      (val) {
        emit(OffersSuccessState(myoffers: val));
      },
    );
  }

  Future<void> showoffers({
    required String name,
    required String description,
    required String imageurl,
  }) async {
    emit(ShowOfferLoadingState());
    try {
      final showoffers = await offersRemoteDataSource.showoffers(
        name: name,
        description: description,
        imageurl: imageurl,
      );
      emit(ShowSuccessState(showoffers: showoffers));
    } catch (e) {
      log("Show Offers Error:$e");
      emit(ShowOffersFaliureState(errormessage: e.toString()));
    }
  }
}
