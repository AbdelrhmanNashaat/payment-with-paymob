import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepPurple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                paymentMethodsGridModel.text,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 12),
              Image.asset(
                paymentMethodsGridModel.imagePath,
                height: 30,
                fit: BoxFit.scaleDown,
              ),
              const Spacer(),
              Visibility(
                visible: isSelected,
                child: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    FontAwesomeIcons.check,
                    color: Colors.deepPurple,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
