import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/repo/home_repo_implementation.dart';
import '../../manager/cubit/pay_intention_cubit.dart';
import 'bottom_sheet_widget.dart';

class PayButton extends StatelessWidget {
  const PayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Order Now',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => BlocProvider(
            create: (context) => PayIntentionCubit(
              homeRepo: HomeRepoImplementation(),
            ),
            child: const BottomSheetWidget(),
          ),
        );
      },
    );
  }
}
