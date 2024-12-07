import 'package:flutter/material.dart';
import '../../../data/models/payment_methods_grid_model.dart';

class PaymentMethodContainer extends StatelessWidget {
  final PaymentMethodsGridModel paymentMethodsGridModel;
  final VoidCallback onTap;
  const PaymentMethodContainer(
      {super.key, required this.paymentMethodsGridModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepPurple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              paymentMethodsGridModel.imagePath,
              height: 90,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(height: 20),
            Text(
              paymentMethodsGridModel.text,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
