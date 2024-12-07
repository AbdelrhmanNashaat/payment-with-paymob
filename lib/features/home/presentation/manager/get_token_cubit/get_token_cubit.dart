import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo.dart';
import 'get_token_state.dart';

class GetTokenCubit extends Cubit<GetTokenState> {
  final HomeRepo paymentRepo;
  GetTokenCubit({required this.paymentRepo}) : super(GetTokenInitial());
  Future<void> getToken() async {
    emit(GetTokenLoading());
    final result = await paymentRepo.getToken();
    result.fold(
      (l) => emit(
        GetTokenFailure(errorMessage: l.message),
      ),
      (r) => emit(
        GetTokenSuccess(token: r),
      ),
    );
  }
}
