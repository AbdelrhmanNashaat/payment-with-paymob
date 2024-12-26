import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/secret_data.dart';
import 'package:payment/features/home/data/repo/payment_repo.dart';
import '../../../../../core/errors/failure.dart';
import 'pay_state.dart';

class PayCubit extends Cubit<PayState> {
  final PaymentRepo paymentRepo;
  PayCubit({required this.paymentRepo}) : super(PayInitial());

  Future<void> pay({required int integrationId}) async {
    emit(PayLoading());
    final paymentProcessResult =
        await paymentRepo.paymentProcessMethod(integrationId: integrationId);
    if (paymentProcessResult.isLeft()) {
      emit(PayFailure(
          message: paymentProcessResult.fold((l) => l.message, (r) => null) ??
              "Unknown error"));
      return;
    }

    final paymentResult = await _processPayment(integrationId);
    paymentResult.fold(
      (failure) => emit(
        PayFailure(message: failure.message),
      ),
      (_) => emit(
        PaySuccess(),
      ),
    );
  }

  Future<Either<ServerFailure, void>> _processPayment(int integrationId) async {
    switch (integrationId) {
      case SecretData.acceptKioskId:
        return await paymentRepo.payWithKiosk(
          paymentToken: SecretData.paymentToken,
        );
      case SecretData.mobileWalletId:
        return await paymentRepo.payWithMobileWallet(
          paymentToken: SecretData.paymentToken,
        );
      case SecretData.onlineCardId:
        emit(PaySuccess());
        return const Right(null);
      default:
        return Left(ServerFailure("Unsupported payment method."));
    }
  }
}
