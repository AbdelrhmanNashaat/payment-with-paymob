import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment/core/utils/api_service.dart';
import 'package:payment/features/payment/data/models/payment_token_model/billing_data.dart';
import 'package:payment/features/payment/data/repo/payment_repo.dart';
import '../../../../core/errors/failure.dart';
import '../models/payment_token_model/payment_token_model.dart';

class PaymentRepoImplementation extends PaymentRepo {
  final ApiService apiService = ApiService();
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
          apartment: "803",
          email: "claudette09@exa.com",
          floor: "42",
          firstName: "Clifford",
          street: "Ethan Land",
          building: "8028",
          phoneNumber: "+86(8)9135210487",
          shippingMethod: "PKG",
          postalCode: "01898",
          city: "Jaskolskiburgh",
          country: "CR",
          lastName: "Nicolas",
          state: "Utah",
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
}
