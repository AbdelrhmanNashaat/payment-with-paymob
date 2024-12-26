abstract class PayState {}

class PayInitial extends PayState {}

class PaySuccess extends PayState {}

class PayLoading extends PayState {}

class PayFailure extends PayState {
  final String message;

  PayFailure({required this.message});
}
