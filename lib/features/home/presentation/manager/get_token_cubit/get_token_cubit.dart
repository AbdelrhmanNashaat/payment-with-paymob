import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo.dart';
import 'get_token_state.dart';

class GetAuthTokenCubit extends Cubit<GetTokenState> {
  final HomeRepo homeRepo;
  GetAuthTokenCubit({required this.homeRepo}) : super(GetTokenInitial());
  Future<void> getToken() async {
    emit(GetTokenLoading());
    final result = await homeRepo.getToken();
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
