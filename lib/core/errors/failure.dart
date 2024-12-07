import 'package:dio/dio.dart';

class ServerFailure {
  final String message;
  ServerFailure(this.message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        return ServerFailure('Connection timeout with API server.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was canceled.');
      case DioExceptionType.unknown:
        return (dioError.message?.contains('SocketException') ?? false)
            ? ServerFailure('No internet connection.')
            : ServerFailure('Unexpected error, please try again.');
      default:
        return ServerFailure('An unknown error occurred, please try again.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(response.toString());
      case 404:
        return ServerFailure('Requested resource not found, please try later.');
      case 500:
        return ServerFailure('Internal server error, please try later.');
      default:
        return ServerFailure(
            'An unexpected error occurred, please try again. error: ${response['message']}');
    }
  }
}
