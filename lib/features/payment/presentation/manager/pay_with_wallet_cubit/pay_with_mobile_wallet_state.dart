abstract class PayWithMobileWalletState {}

class PayWithMobileWalletInitial extends PayWithMobileWalletState {}

class PayWithMobileWalletLoading extends PayWithMobileWalletState {}

class PayWithMobileWalletSuccess extends PayWithMobileWalletState {
  final String redirectUrl;
  PayWithMobileWalletSuccess({required this.redirectUrl});
}

class PayWithMobileWalletFailure extends PayWithMobileWalletState {
  final String message;

  PayWithMobileWalletFailure({required this.message});
}
