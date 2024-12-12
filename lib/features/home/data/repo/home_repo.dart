import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/order_data_model/item.dart';
import '../models/order_data_model/shipping_data.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, String>> getToken();
  Future<Either<ServerFailure, int>> getOrderId({
    required String authToken,
    required String deliveryNeeded,
    required String amountCents,
    required List<Item> items,
    required ShippingData shippingData,
  });
}
