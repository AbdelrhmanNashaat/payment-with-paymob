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
Steps to integrate paymob
1. use the api to get token that is only available for only one hour 
2. use the api to get order id then select method of payment
3. use the api to get payment token
to pay with kiosk use the api to get bill_reference
*/