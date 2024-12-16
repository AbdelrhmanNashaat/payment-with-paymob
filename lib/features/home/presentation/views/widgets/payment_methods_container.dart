import 'package:flutter/material.dart';
import 'package:payment/features/home/data/models/payment_method_model.dart';

class PaymentMethodContainer extends StatelessWidget {
  final PaymentMethodModel paymentMethodModel;
  final VoidCallback onPressed;
  final bool isActive;
  const PaymentMethodContainer({
    super.key,
    required this.paymentMethodModel,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isActive ? const Color(0xff844EFE) : Colors.white,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              Image.asset(
                paymentMethodModel.image,
                width: 26,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 6),
              Text(
                paymentMethodModel.text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
