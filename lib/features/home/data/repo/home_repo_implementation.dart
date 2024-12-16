import 'dart:developer';
import 'package:uuid/uuid.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/core/utils/api_service.dart';
import 'package:payment/features/home/data/models/intention_model/billing_data.dart';
import 'package:payment/features/home/data/models/intention_model/intention_model.dart';
import 'package:payment/features/home/data/repo/home_repo.dart';
import '../models/intention_model/extras.dart';
import '../models/intention_model/item.dart';

class HomeRepoImplementation extends HomeRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<ServerFailure, void>> payIntention(
      {required int paymentMethods}) async {
    try {
      var uuid = const Uuid();
      String specialReference = uuid.v4();
      final IntentionModel data = IntentionModel(
        amount: 220000,
        currency: "EGP",
        paymentMethods: [paymentMethods],
        items: [
          Item(
            name: 'Polo Shirt for men',
            description: 'blue',
            amount: 65000,
            quantity: 1,
          ),
          Item(
            name: 'Scott Bag',
            description: 'blue , white',
            amount: 30000,
            quantity: 1,
          ),
          Item(
            name: 'Pro Tour Shoes',
            description: 'blue , red',
            amount: 80000,
            quantity: 1,
          ),
          Item(
            name: 'T250 Headphones',
            description: 'light blue',
            amount: 45000,
            quantity: 1,
          ),
        ],
        billingData: BillingData(
          apartment: "dumy",
          firstName: "Abdelrhman",
          lastName: "Nashaat",
          street: "dumy",
          building: "dumy",
          phoneNumber: "01014977210",
          city: "dumy",
          country: "dumy",
          email: "abdelrhman.nashaat22@gmail.com",
          floor: "dumy",
          state: "dumy",
        ),
        extras: Extras(ee: 22),
        specialReference: specialReference,
        notificationUrl:
            "https://webhook.site/f60597f3-97b9-4992-90e1-6f98a63fc32d",
        redirectionUrl: "https://www.google.com/",
      );
      var response =
          await apiService.post(endPont: 'v1/intention/', data: data);
      log('response: $response');
      return const Right(null);
    } catch (ex) {
      if (ex is DioException) {
        final dioError = ServerFailure.fromDioError(ex);
        log('dioError: ${dioError.errorMessage}');
        return Left(dioError);
      } else {
        log('Not DioException, $ex, ${ex.runtimeType}');
        return Left(
          ServerFailure('Not DioException, $ex, ${ex.runtimeType}'),
        );
      }
    }
  }
}
