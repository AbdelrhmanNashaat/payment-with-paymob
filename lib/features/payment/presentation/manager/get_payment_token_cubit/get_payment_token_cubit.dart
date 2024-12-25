import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/payment/data/repo/payment_repo.dart';
import 'get_payment_token_state.dart';

class GetPaymentTokenCubit extends Cubit<GetPaymentTokenState> {
  final PaymentRepo paymentRepo;
  GetPaymentTokenCubit({required this.paymentRepo})
      : super(GetPaymentTokenInitial());
  Future<void> getPaymentToken({
    required String authToken,
    required String amountCents,
    required int orderId,
    required int integrationId,
  }) async {
    emit(GetPaymentTokenLoading());
    final result = await paymentRepo.getPaymentToken(
      authToken: authToken,
      amountCents: amountCents,
      orderId: orderId,
      integrationId: integrationId,
    );
    result.fold(
      (l) => emit(GetPaymentTokenFailure(message: l.message)),
      (r) => emit(GetPaymentTokenSuccess(paymentToken: r)),
    );
  }
}
