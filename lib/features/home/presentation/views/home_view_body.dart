import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/secret_data.dart';
import 'package:payment/features/home/data/repo/home_repo_implementation.dart';
import 'package:payment/features/home/presentation/manager/get_token_cubit/get_token_cubit.dart';
import '../manager/get_token_cubit/get_token_state.dart';
import 'widgets/home_view_body_success_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeRepoImplementation homeRepoImplementation =
        HomeRepoImplementation();
    return BlocProvider(
      create: (context) =>
          GetAuthTokenCubit(homeRepo: homeRepoImplementation)..getToken(),
      child: BlocConsumer<GetAuthTokenCubit, GetTokenState>(
        listener: (context, state) {
          if (state is GetTokenSuccess) {
            SecretData.authToken = state.token;
          }
        },
        builder: (context, state) {
          return state is GetTokenLoading
              ? const Center(child: CircularProgressIndicator())
              : state is GetTokenSuccess
                  ? HomeViewBodySuccessWidget(
                      homeRepoImplementation: homeRepoImplementation)
                  : const Center(
                      child: Text('Check your internet connection'),
                    );
        },
      ),
    );
  }
}
