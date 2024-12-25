import 'package:flutter/material.dart';
import '../../../data/models/payment_methods_grid_model.dart';

class PaymentMethodContainer extends StatelessWidget {
  final PaymentMethodsGridModel paymentMethodsGridModel;
  final Function onTap;
  final bool isSelected;

  const PaymentMethodContainer({
    super.key,
    required this.paymentMethodsGridModel,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.deepPurple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                paymentMethodsGridModel.text,
                style: TextStyle(
                  fontSize: 26,
                  color: isSelected ? Colors.blueAccent : Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 12),
              Image.asset(
                paymentMethodsGridModel.imagePath,
                height: 30,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
