import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  Future<Either<ServerFailure, String>> getAuthToken() async {
    try {
      var data = await apiService.post(
        url: 'https://accept.paymob.com/api/auth/tokens',
        data: {
          "api_key": SecretData.apiKey,
        },
      );
      SecretData.authToken = data['token'];
      debugPrint('authToken: done');
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
  }) async {
    try {
      int totalAmountInCents = 0;
      final List<Item> items = [
        Item(
          name: 'Polo Shirt for men',
          amountCents: '65000',
          quantity: '1',
          description: 'mens polo shirt',
        ),
        Item(
          name: 'Scott Bag',
          amountCents: '30000',
          quantity: '1',
          description: 'back bag',
        ),
        Item(
          name: 'Pro Tour Shoes',
          amountCents: '80000',
          quantity: '1',
          description: 'running shoes',
        ),
        Item(
          name: 'T250 Headphones',
          amountCents: '45000',
          quantity: '1',
          description: 'headphones',
        ),
      ];
      ShippingData shippingData = ShippingData(
        apartment: "Apt 12B",
        email: "Abdelrhman.nashaat@gmail.com",
        floor: "2nd",
        firstName: "Abdelrhman",
        street: "123 Main St",
        building: "Building 1",
        phoneNumber: "01010101010",
        postalCode: "12345",
        extraDescription: "Near the park",
        city: "Cairo",
        country: "Egypt",
        lastName: "Doe",
        state: "Cairo",
      );
      for (var item in items) {
        totalAmountInCents +=
            int.parse(item.amountCents!) * int.parse(item.quantity!);
      }
      SecretData.amountCents = totalAmountInCents.toString();
      final OrderDataModel orderDataModel = OrderDataModel(
        authToken: authToken,
        deliveryNeeded: "false",
        amountCents: '$totalAmountInCents',
        items: items,
        currency: 'EGP',
        shippingData: shippingData,
        merchantOrderId: Random().nextInt(100000),
      );
      var data = await apiService.post(
        url: 'https://accept.paymob.com/api/ecommerce/orders',
        data: orderDataModel.toJson(),
      );
      SecretData.orderId = data['id'];
      debugPrint('order id: done');
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
    required int orderId,
    required int integrationId,
  }) async {
    try {
      final PaymentTokenModel paymentModel = PaymentTokenModel(
        authToken: authToken,
        amountCents: SecretData.amountCents,
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
          phoneNumber: "01010101010",
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
      SecretData.paymentToken = data['token'];
      debugPrint('payment token: done');
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
      debugPrint('kiosk: done');
      SecretData.kioskId = data['id'];
      return Right(data['id']);
    } catch (ex) {
      if (ex is DioException) {
        return Left(ServerFailure.fromDioError(ex));
      } else {
        return Left(
          ServerFailure('ex is not DioException $ex'),
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
            "identifier": "01010101010",
            "subtype": "WALLET",
          },
          "payment_token": paymentToken,
        },
      );
      debugPrint('mobile wallet : done');
      debugPrint('mobile wallet url: ${data['iframe_redirection_url']}');
      SecretData.mobileWalletUrl = data['iframe_redirection_url'];
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

  @override
  Future<Either<ServerFailure, String>> paymentProcessMethod(
      {required int integrationId}) async {
    try {
      await getAuthToken();
      await getOrderId(authToken: SecretData.authToken);
      await getPaymentToken(
        authToken: SecretData.authToken,
        orderId: SecretData.orderId,
        integrationId: integrationId,
      );
      return const Right('done');
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
