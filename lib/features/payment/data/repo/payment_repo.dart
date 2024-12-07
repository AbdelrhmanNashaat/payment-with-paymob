import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class PaymentRepo {
  Future<Either<ServerFailure, String>> getToken();
}
