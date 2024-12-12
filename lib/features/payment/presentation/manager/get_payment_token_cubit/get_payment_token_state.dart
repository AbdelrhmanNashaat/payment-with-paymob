abstract class GetPaymentTokenState {}

class GetPaymentTokenInitial extends GetPaymentTokenState {}

class GetPaymentTokenLoading extends GetPaymentTokenState {}

class GetPaymentTokenSuccess extends GetPaymentTokenState {
  final String paymentToken;

  GetPaymentTokenSuccess({required this.paymentToken});
}

class GetPaymentTokenFailure extends GetPaymentTokenState {
  final String message;

  GetPaymentTokenFailure({required this.message});
}
