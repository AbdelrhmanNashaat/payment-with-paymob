import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/home/data/repo/home_repo.dart';

import 'pay_intention_state.dart';

class PayIntentionCubit extends Cubit<PayIntentionState> {
  final HomeRepo homeRepo;
  PayIntentionCubit({required this.homeRepo}) : super(PayIntentionInitial());
  Future<void> payIntention({required int paymentMethods}) async {
    emit(PayIntentionLoading());
    final result = await homeRepo.payIntention(paymentMethods: paymentMethods);
    result.fold(
      (l) => emit(PayIntentionFailure(errorMessage: l.errorMessage)),
      (r) => emit(PayIntentionSuccess(clinetSecret: r)),
    );
  }
}
