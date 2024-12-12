import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/core/utils/secret_data.dart';
import 'package:payment/core/utils/api_service.dart';
import 'package:payment/features/home/data/repo/home_repo.dart';
import '../models/order_data_model/item.dart';
import '../models/order_data_model/order_data_model.dart';
import '../models/order_data_model/shipping_data.dart';

class HomeRepoImplementation extends HomeRepo {
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
}
