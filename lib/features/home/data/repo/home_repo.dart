import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, dynamic>> getToken();
}
