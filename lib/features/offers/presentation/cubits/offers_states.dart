abstract class OffersState {}

class OffersInitialState extends OffersState {}

class OffersLoadingState extends OffersState {}

class OffersFaliureState extends OffersState {
  final String errormessage;

  OffersFaliureState({required this.errormessage});
}

class OffersSuccessState extends OffersState {
  final List myoffers;

  OffersSuccessState({required this.myoffers});
}


class ShowOfferLoadingState extends OffersState {}

class ShowOffersFaliureState extends OffersState {
  final String errormessage;

  ShowOffersFaliureState({required this.errormessage});
}

class ShowSuccessState extends OffersState {
  final Map showoffers;

  ShowSuccessState({required this.showoffers});
}
