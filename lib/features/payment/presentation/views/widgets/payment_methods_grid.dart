import 'package:flutter/material.dart';

import '../../../data/models/payment_methods_grid_model.dart';
import 'payment_methods_container.dart';

class PaymentMethodsGrid extends StatelessWidget {
  const PaymentMethodsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<PaymentMethodsGridModel> paymentList = [
      PaymentMethodsGridModel(
        text: 'Kiosk',
        imagePath: 'assets/images/self-service.png',
      ),
      PaymentMethodsGridModel(
        text: 'Wallet',
        imagePath: 'assets/images/wallet.png',
      ),
      PaymentMethodsGridModel(
        text: 'Paypal',
        imagePath: 'assets/images/paypal.png',
      ),
      PaymentMethodsGridModel(
        text: 'Card',
        imagePath: 'assets/images/atm-card.png',
      ),
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: paymentList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return PaymentMethodContainer(
          paymentMethodsGridModel: paymentList[index],
          onTap: () => navToPay(index: index),
        );
      },
    );
  }

  void navToPay({required int index}) {
    switch (index) {
      case 0:
        // navigate to kiosk
        break;
      case 1:
        // navigate to wallet
        break;
      case 2:
        // navigate to paypal
        break;
      case 3:
        // navigate to card
        break;
    }
  }
}
