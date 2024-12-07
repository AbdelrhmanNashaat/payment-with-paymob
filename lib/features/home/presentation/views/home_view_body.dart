import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/home/data/repo/home_repo_implementation.dart';
import 'package:payment/features/home/presentation/manager/get_token_cubit/get_token_cubit.dart';
import 'widgets/button.dart';
import 'widgets/items_list.dart';
import 'widgets/total_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const CartListView(),
          const Spacer(),
          const Divider(height: 20),
          const TotalWidget(),
          const SizedBox(height: 20),
          BlocProvider(
            create: (context) =>
                GetTokenCubit(paymentRepo: HomeRepoImplementation()),
            child: const CustomButton(),
          ),
          const SizedBox(height: 35),
        ],
      ),
    );
  }
}
