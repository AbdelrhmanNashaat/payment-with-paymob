import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/api_service.dart';
import 'package:payment/features/payment/data/repo/payment_repo.dart';

class PaymentRepoImplementation extends PaymentRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<ServerFailure, String>> getToken() async {
    try {
      var data = await apiService.post(
        url: 'https://accept.paymob.com/api/auth/tokens',
        data: {
          "api_key": ApiKeys.apiKey,
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
}
