abstract class PayWithKioskState {}

class PayWithKioskInitial extends PayWithKioskState {}

class PayWithKioskLoading extends PayWithKioskState {}

class PayWithKioskSuccess extends PayWithKioskState {
  final int billReference;

  PayWithKioskSuccess({required this.billReference});
}

class PayWithKioskFailure extends PayWithKioskState {
  final String message;
  PayWithKioskFailure({required this.message});
}
