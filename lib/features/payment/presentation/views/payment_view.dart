import 'package:flutter/material.dart';

import 'widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9F8),
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F9F8),
        centerTitle: true,
        title: const Text('Payment Methods'),
      ),
      body: const SafeArea(child: PaymentViewBody()),
    );
  }
}
