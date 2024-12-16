import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/core/utils/secret_data.dart';
import 'package:payment/features/home/data/models/payment_method_model.dart';
import 'payment_methods_container.dart';

class PaymentMethodsGrid extends StatefulWidget {
  const PaymentMethodsGrid({
    super.key,
  });

  @override
  State<PaymentMethodsGrid> createState() => _PaymentMethodsGridState();
}

class _PaymentMethodsGridState extends State<PaymentMethodsGrid> {
  int activeIndex = -1;
  @override
  Widget build(BuildContext context) {
    final List<PaymentMethodModel> paymentMethodList = [
      PaymentMethodModel(
        text: 'Wallet',
        image: 'assets/images/wallet.png',
        paymentMethod: SecretData.mobileWalletId,
      ),
      PaymentMethodModel(
        text: 'Kiosk',
        image: 'assets/images/self-service.png',
        paymentMethod: SecretData.acceptKioskId,
      ),
      PaymentMethodModel(
        text: 'PayPal',
        image: 'assets/images/paypal.png',
        paymentMethod: SecretData.mobileWalletId,
      ),
      PaymentMethodModel(
        text: 'Card',
        image: 'assets/images/atm-card.png',
        paymentMethod: SecretData.mobileWalletId,
      ),
    ];
    return GridView.builder(
      itemCount: paymentMethodList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return PaymentMethodContainer(
          paymentMethodModel: paymentMethodList[index],
          onPressed: () {
            setState(() {
              activeIndex = index;
              log('activeIndex: $activeIndex');
            });
          },
          isActive: index == activeIndex,
        );
      },
    );
  }
}
