abstract class GetOrderIdState {}

class GetOrderIdInitial extends GetOrderIdState {}

class GetOrderIdLoading extends GetOrderIdState {}

class GetOrderIdSuccess extends GetOrderIdState {
  final String orderId;

  GetOrderIdSuccess({required this.orderId});
}

class GetOrderIdFailure extends GetOrderIdState {
  final String errorMessage;

  GetOrderIdFailure({required this.errorMessage});
}
