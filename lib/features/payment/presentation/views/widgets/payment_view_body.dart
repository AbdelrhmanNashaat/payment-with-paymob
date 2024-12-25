import 'package:flutter/material.dart';
import 'payment_methods_grid.dart';
import 'payment_token_button.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 45),
          Image.asset(
            'assets/images/smartphone.png',
            height: 250,
          ),
          const SizedBox(height: 55),
          const PaymentMethodsGrid(),
          const SizedBox(height: 15),
          const GetPaymentTokenButton(),
        ],
      ),
    );
  }
}
