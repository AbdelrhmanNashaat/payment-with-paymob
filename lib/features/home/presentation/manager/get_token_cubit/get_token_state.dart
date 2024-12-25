abstract class GetTokenState {}

class GetTokenInitial extends GetTokenState {}

class GetTokenLoading extends GetTokenState {}

class GetTokenSuccess extends GetTokenState {
  final String token;

  GetTokenSuccess({required this.token});
}

class GetTokenFailure extends GetTokenState {
  final String errorMessage;

  GetTokenFailure({required this.errorMessage});
}
