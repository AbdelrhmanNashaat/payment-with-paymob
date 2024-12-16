import 'package:flutter/material.dart';
import 'package:payment/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

/* 
steps to integrate payment gateway in flutter
1. determine who will pay (person)
2. how much will be paid (amount)
3. what is the payment method (UPI, card, net banking)
4. pay the amount
*/


/*
https://accept.paymobsolutions.com/api/acceptance/post_pay?publicKey=%3Cegy_pk_test_gcNxOWiwRwRh4tWB2DyduRkvQqCxozAi%3E&clientSecret=%3Cegy_csk_test_9fd6c648e8fa46fb9629a352841289e6%3E
*/