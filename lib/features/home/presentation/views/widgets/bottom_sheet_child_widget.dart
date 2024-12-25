import 'package:flutter/material.dart';
import 'package:payment/features/home/presentation/views/widgets/payment_methods_list.dart';

import '../../../../../core/widgets/custom_button.dart';

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
          CustomButton(
            text: 'Continue',
            onPressed: () {
              // TODO
            },
          ),
        ],
      ),
    );
  }
}
