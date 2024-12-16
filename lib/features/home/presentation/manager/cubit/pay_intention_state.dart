abstract class PayIntentionState {}

class PayIntentionInitial extends PayIntentionState {}

class PayIntentionLoading extends PayIntentionState {}

class PayIntentionSuccess extends PayIntentionState {}

class PayIntentionFailure extends PayIntentionState {
  final String errorMessage;

  PayIntentionFailure({required this.errorMessage});
}
