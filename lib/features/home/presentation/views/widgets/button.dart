import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/home/data/repo/payment_repo_implementation.dart';
import 'package:payment/features/home/presentation/manager/pay_cubit/pay_cubit.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'bottom_sheet_child_widget.dart';

class ChoosePaymentMethod extends StatelessWidget {
  const ChoosePaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Order Now',
      onPressed: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          context: context,
          builder: (context) {
            return BlocProvider<PayCubit>(
              create: (context) => PayCubit(
                paymentRepo: PaymentRepoImplementation(),
              ),
              child: const BottomSheetChildWidget(),
            );
          },
        );
      },
    );
  }
}
