import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/home/presentation/manager/pay_cubit/pay_cubit.dart';
import 'package:payment/features/home/presentation/manager/pay_cubit/pay_state.dart';
import 'package:payment/features/home/presentation/views/pay_with_card.dart';
import 'package:payment/features/home/presentation/views/widgets/payment_methods_list.dart';
import '../../../../../core/utils/secret_data.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../accept_kiosk_view.dart';

class BottomSheetChildWidget extends StatelessWidget {
  const BottomSheetChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          const PaymentMethodsList(),
          const SizedBox(height: 12),
          BlocConsumer<PayCubit, PayState>(
            listener: (context, state) {
              if (state is PaySuccess) {
                log('SecretData.integrationId: ${SecretData.kioskId}');
                Navigator.pop(context);
                if (SecretData.integrationId == SecretData.onlineCardId ||
                    SecretData.integrationId == SecretData.mobileWalletId) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PaymentWithInAppWebView(
                          url: SecretData.integrationId ==
                                  SecretData.onlineCardId
                              ? '${SecretData.cardUrl}${SecretData.paymentToken}'
                              : SecretData.mobileWalletUrl,
                        );
                      },
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AcceptKioskView();
                      },
                    ),
                  );
                }
              }
              if (state is PayFailure) {
                log('Payment failed with error: ${state.message}');
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is PayLoading ? true : false,
                text: 'Continue',
                onPressed: () {
                  payButtonMethod(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void payButtonMethod(BuildContext context) {
    if (SecretData.integrationId != 0) {
      context.read<PayCubit>().pay(integrationId: SecretData.integrationId);
    }
  }
}
