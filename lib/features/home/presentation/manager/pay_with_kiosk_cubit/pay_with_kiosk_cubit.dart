import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/home/data/repo/payment_repo.dart';
import 'pay_with_kiosk_state.dart';

class PayWithKioskCubit extends Cubit<PayWithKioskState> {
  final PaymentRepo paymentRepo;
  PayWithKioskCubit({required this.paymentRepo}) : super(PayWithKioskInitial());
  Future<void> payWithKiosk({required String paymentToken}) async {
    emit(PayWithKioskLoading());
    final response = await paymentRepo.payWithKiosk(paymentToken: paymentToken);
    response.fold(
      (failure) => emit(PayWithKioskFailure(message: failure.message)),
      (billReference) =>
          emit(PayWithKioskSuccess(billReference: billReference)),
    );
  }
}
