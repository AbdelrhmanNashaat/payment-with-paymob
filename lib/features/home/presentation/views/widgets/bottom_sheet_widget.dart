import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/secret_data.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/payment_method_model.dart';
import '../../manager/cubit/pay_intention_cubit.dart';
import '../../manager/cubit/pay_intention_state.dart';
import '../pay_view.dart';
import 'payment_methods_grid.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  PaymentMethodModel? selectedPaymentMethod;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodsGrid(
            onPaymentMethodSelected: (paymentMethod) {
              setState(() {
                selectedPaymentMethod = paymentMethod;
              });
            },
          ),
          const SizedBox(height: 16),
          BlocConsumer<PayIntentionCubit, PayIntentionState>(
            listener: (context, state) {
              if (state is PayIntentionSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PayView(
                        url:
                            'https://accept.paymobsolutions.com/api/acceptance/post_pay?publicKey=${SecretData.publicKey}clientSecret=${state.clinetSecret}'),
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is PayIntentionLoading ? true : false,
                text: 'Pay',
                onPressed: () {
                  if (selectedPaymentMethod != null) {
                    context.read<PayIntentionCubit>().payIntention(
                          paymentMethods: selectedPaymentMethod!.paymentMethod,
                        );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
