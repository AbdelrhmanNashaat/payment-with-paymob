import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo_implementation.dart';
import '../../manager/get_order_id_cubit/get_order_id_cubit.dart';
import 'button.dart';
import 'items_list.dart';
import 'total_widget.dart';

class HomeViewBodySuccessWidget extends StatelessWidget {
  const HomeViewBodySuccessWidget({
    super.key,
    required this.homeRepoImplementation,
  });

  final HomeRepoImplementation homeRepoImplementation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const CartListView(),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 20),
          ),
          const TotalWidget(),
          const SizedBox(height: 20),
          BlocProvider(
            create: (context) =>
                GetOrderIdCubit(homeRepo: homeRepoImplementation),
            child: const GetOrderIdButton(),
          ),
          const SizedBox(height: 35),
        ],
      ),
    );
  }
}
