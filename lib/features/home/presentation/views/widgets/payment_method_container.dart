import 'package:flutter/material.dart';
import '../../../data/models/payment_method_list_item_model.dart';

class PaymentMethodContainer extends StatelessWidget {
  final PaymentMethodsListModel paymentMethodsGridModel;
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
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.only(right: 10),
        duration: const Duration(milliseconds: 300),
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
                  fontSize: 16,
                  color: isSelected ? Colors.blueAccent : Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(
                paymentMethodsGridModel.imagePath,
                height: 24,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
