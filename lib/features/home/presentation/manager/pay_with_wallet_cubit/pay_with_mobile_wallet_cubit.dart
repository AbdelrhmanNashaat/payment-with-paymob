import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/home/data/repo/payment_repo.dart';

import 'pay_with_mobile_wallet_state.dart';

class PayWithMobileWalletCubit extends Cubit<PayWithMobileWalletState> {
  final PaymentRepo paymentRepo;
  PayWithMobileWalletCubit({required this.paymentRepo})
      : super(PayWithMobileWalletInitial());
  Future<void> payWithMobile({required String paymentToken}) async {
    emit(PayWithMobileWalletLoading());
    final response =
        await paymentRepo.payWithMobileWallet(paymentToken: paymentToken);
    response.fold(
      (failure) => emit(PayWithMobileWalletFailure(message: failure.message)),
      (redirectUrl) =>
          emit(PayWithMobileWalletSuccess(redirectUrl: redirectUrl)),
    );
  }
}
