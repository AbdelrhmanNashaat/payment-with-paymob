import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, String>> payIntention(
      {required int paymentMethods});
}
