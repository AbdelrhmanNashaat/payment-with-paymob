import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment/core/utils/api_service.dart';
import 'package:payment/features/home/data/models/payment_token_model/billing_data.dart';
import 'package:payment/features/home/data/repo/payment_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/secret_data.dart';
import '../models/order_data_model/item.dart';
import '../models/order_data_model/order_data_model.dart';
import '../models/order_data_model/shipping_data.dart';
import '../models/payment_token_model/payment_token_model.dart';

class PaymentRepoImplementation extends PaymentRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<ServerFailure, String>> getToken() async {
    try {
      var data = await apiService.post(
        url: 'https://accept.paymob.com/api/auth/tokens',
        data: {
          "api_key": SecretData.apiKey,
        },
      );
      return Right(data['token']);
    } catch (ex) {
      if (ex is DioException) {
        return Left(ServerFailure.fromDioError(ex));
      } else {
        return Left(
          ServerFailure('ex is not DioException,$ex'),
        );
      }
    }
  }

  @override
  Future<Either<ServerFailure, int>> getOrderId({
    required String authToken,
    required String deliveryNeeded,
    required String amountCents,
    required List<Item> items,
    required ShippingData shippingData,
  }) async {
    try {
      final OrderDataModel orderDataModel = OrderDataModel(
        authToken: authToken,
        deliveryNeeded: deliveryNeeded,
        amountCents: amountCents,
        items: items,
        currency: 'EGP',
        shippingData: shippingData,
        merchantOrderId: Random().nextInt(100000),
      );
      var data = await apiService.post(
        url: 'https://accept.paymob.com/api/ecommerce/orders',
        data: orderDataModel.toJson(),
      );
      return Right(data['id']);
    } catch (ex) {
      if (ex is DioException) {
        return Left(ServerFailure.fromDioError(ex));
      } else {
        return Left(
          ServerFailure('ex is not DioException'),
        );
      }
    }
  }

  @override
  Future<Either<ServerFailure, String>> getPaymentToken({
    required String authToken,
    required String amountCents,
    required int orderId,
    required int integrationId,
  }) async {
    try {
      final PaymentTokenModel paymentModel = PaymentTokenModel(
        authToken: authToken,
        amountCents: amountCents,
        orderId: orderId,
        integrationId: integrationId,
        currency: 'EGP',
        lockOrderWhenPaid: 'false',
        expiration: 3600,
        billingData: BillingData(
          apartment: "102",
          email: "abdelrhman.nashaat22@gmail.com",
          floor: "1",
          firstName: "Abdelrhman",
          street: "El-Sherouk Street",
          building: "15",
          phoneNumber: "+201014977210",
          shippingMethod: "PKG",
          postalCode: "12345",
          city: "Cairo",
          country: "EG",
          lastName: "Hussinen",
          state: "Cairo",
        ),
      );
      var data = await apiService.post(
        url: 'https://accept.paymob.com/api/acceptance/payment_keys',
        data: paymentModel.toJson(),
      );
      return Right(data['token']);
    } catch (ex) {
      if (ex is DioException) {
        return Left(ServerFailure.fromDioError(ex));
      } else {
        return Left(
          ServerFailure('ex is not DioException'),
        );
      }
    }
  }

  @override
  Future<Either<ServerFailure, int>> payWithKiosk(
      {required String paymentToken}) async {
    try {
      var data = await apiService.post(
        url: 'https://accept.paymob.com/api/acceptance/payments/pay',
        data: {
          "source": {
            "identifier": "AGGREGATOR",
            "subtype": "AGGREGATOR",
          },
          "payment_token": paymentToken,
        },
      );
      return Right(data['data']['bill_reference']);
    } catch (ex) {
      if (ex is DioException) {
        return Left(ServerFailure.fromDioError(ex));
      } else {
        return Left(
          ServerFailure('ex is not DioException'),
        );
      }
    }
  }

  @override
  Future<Either<ServerFailure, String>> payWithMobileWallet(
      {required String paymentToken}) async {
    try {
      var data = await apiService.post(
        url: 'https://accept.paymob.com/api/acceptance/payments/pay',
        data: {
          "source": {
            "identifier": "+201014977210",
            "subtype": "WALLET",
          },
          "payment_token": paymentToken,
        },
      );
      return Right(data['iframe_redirection_url']);
    } catch (ex) {
      if (ex is DioException) {
        return Left(ServerFailure.fromDioError(ex));
      } else {
        return Left(
          ServerFailure('ex is not DioException'),
        );
      }
    }
  }
}
