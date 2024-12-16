import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, void>> payIntention(
      {required int paymentMethods});
}
