import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/secret_data.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/repo/payment_repo_implementation.dart';
import '../../manager/get_payment_token_cubit/get_payment_token_cubit.dart';
import '../../manager/get_payment_token_cubit/get_payment_token_state.dart';
import '../pay_view.dart';

class GetPaymentTokenButton extends StatelessWidget {
  const GetPaymentTokenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPaymentTokenCubit(
        paymentRepo: PaymentRepoImplementation(),
      ),
      child: BlocConsumer<GetPaymentTokenCubit, GetPaymentTokenState>(
        listener: (context, state) {
          if (state is GetPaymentTokenSuccess) {
            SecretData.paymentToken = state.paymentToken;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PayView(
                  paymentMethod: SecretData.integrationId.toString(),
                ),
              ),
            );
          }
          if (state is GetPaymentTokenFailure) {
            log('Payment Token Error: ${state.message}');
          }
        },
        builder: (context, state) {
          return CustomButton(
            text: 'Continue',
            isLoading: state is GetPaymentTokenLoading ? true : false,
            onPressed: () {
              if (SecretData.integrationId != 0) {
                context.read<GetPaymentTokenCubit>().getPaymentToken(
                      authToken: SecretData.authToken,
                      orderId: SecretData.orderId,
                      amountCents: SecretData.amountCent,
                      integrationId: SecretData.integrationId,
                    );
              }
            },
          );
        },
      ),
    );
  }
}
