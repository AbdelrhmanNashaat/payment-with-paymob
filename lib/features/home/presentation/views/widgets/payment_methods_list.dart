import 'package:flutter/material.dart';
import 'package:payment/core/utils/secret_data.dart';
import '../../../data/models/payment_method_list_item_model.dart';
import 'payment_method_container.dart';

class PaymentMethodsList extends StatefulWidget {
  const PaymentMethodsList({
    super.key,
  });

  @override
  State<PaymentMethodsList> createState() => _PaymentMethodsListState();
}

class _PaymentMethodsListState extends State<PaymentMethodsList> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final List<PaymentMethodsListModel> paymentList = [
      PaymentMethodsListModel(
        text: 'Kiosk',
        imagePath: 'assets/images/self-service.png',
        integrationId: SecretData.acceptKioskId,
      ),
      PaymentMethodsListModel(
        text: 'Card',
        imagePath: 'assets/images/atm-card.png',
        integrationId: SecretData.onlineCardId,
      ),
      PaymentMethodsListModel(
        text: 'Wallet',
        imagePath: 'assets/images/wallet.png',
        integrationId: SecretData.mobileWalletId,
      ),
    ];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
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
      ),
    );
  }
}
