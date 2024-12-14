import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class PaymentRepo {
  Future<Either<ServerFailure, String>> getPaymentToken({
    required String authToken,
    required String amountCents,
    required int orderId,
    required int integrationId,
  });
  Future<Either<ServerFailure, int>> payWithKiosk({
    required String paymentToken,
  });
  Future<Either<ServerFailure, String>> payWithMobileWallet({
    required String paymentToken,
  });
}
