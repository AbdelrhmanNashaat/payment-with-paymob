import 'package:flutter/material.dart';
import 'package:payment/core/utils/secret_data.dart';
import '../../../data/models/payment_methods_grid_model.dart';
import 'payment_methods_container.dart';

class PaymentMethodsGrid extends StatefulWidget {
  const PaymentMethodsGrid({
    super.key,
  });

  @override
  State<PaymentMethodsGrid> createState() => _PaymentMethodsGridState();
}

class _PaymentMethodsGridState extends State<PaymentMethodsGrid> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final List<PaymentMethodsGridModel> paymentList = [
      PaymentMethodsGridModel(
        text: 'Kiosk',
        imagePath: 'assets/images/self-service.png',
        integrationId: SecretData.acceptKioskId,
      ),
      PaymentMethodsGridModel(
        text: 'Wallet',
        imagePath: 'assets/images/wallet.png',
        integrationId: SecretData.mobileWalletId,
      ),
      PaymentMethodsGridModel(
        text: 'Card',
        imagePath: 'assets/images/atm-card.png',
        integrationId: SecretData.onlineCardId,
      ),
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: paymentList.length,
      itemBuilder: (context, index) {
        return PaymentMethodContainer(
          isSelected: index == selectedIndex,
          paymentMethodsGridModel: paymentList[index],
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            if (paymentList[index].integrationId != null) {
              SecretData.integrationId = paymentList[index].integrationId!;
            }
          },
        );
      },
    );
  }
}
