import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  Future<void> post({required String url, required Object? data}) async {
    var response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: {},
      ),
    );
    return response.data;
  }
}
