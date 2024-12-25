import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/order_data_model/item.dart';
import '../models/order_data_model/shipping_data.dart';

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
  Future<Either<ServerFailure, String>> getToken();
  Future<Either<ServerFailure, int>> getOrderId({
    required String authToken,
    required String deliveryNeeded,
    required String amountCents,
    required List<Item> items,
    required ShippingData shippingData,
  });
}
