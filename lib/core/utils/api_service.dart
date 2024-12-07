import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  Future<Map<String, dynamic>> post(
      {required String url, required Object? data}) async {
    var response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return response.data;
  }
}
