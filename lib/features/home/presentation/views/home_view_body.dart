import 'package:flutter/material.dart';
import 'widgets/payment_methods_grid.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Center(child: PaymentMethodsGrid()),
    );
  }
}
