import 'package:dio/dio.dart';
import 'package:payment/core/utils/secret_data.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = 'https://accept.paymob.com/';
  Future<Map<String, dynamic>> post(
      {required String endPont, required Object? data}) async {
    var response = await dio.post(
      '$baseUrl$endPont',
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token ${SecretData.secretKey}',
        },
      ),
    );
    return response.data;
  }
}
