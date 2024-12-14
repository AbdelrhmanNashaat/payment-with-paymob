import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/secret_data.dart';
import 'package:payment/features/payment/presentation/manager/pay_with_kiosk_cubit/pay_with_kiosk_cubit.dart';
import 'package:payment/features/payment/presentation/manager/pay_with_wallet_cubit/pay_with_mobile_wallet_cubit.dart';
import 'pay_with_kiosk_widget.dart';
import 'pay_with_mobile_wallet.dart';

class PayViewBody extends StatefulWidget {
  final String paymentMethod;
  const PayViewBody({super.key, required this.paymentMethod});

  @override
  State<PayViewBody> createState() => _PayViewBodyState();
}

class _PayViewBodyState extends State<PayViewBody> {
  String paymentMethod = '';
  @override
  void initState() {
    paymentMethod = pay(paymentMethod: widget.paymentMethod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return paymentMethod == "Kiosk"
        ? const PaymentWithKioskWidget()
        : paymentMethod == "mobile"
            ? const PaymentWithMobileWallet()
            : const Center();
  }

  String pay({required String paymentMethod}) {
    if (paymentMethod == SecretData.acceptKioskId.toString()) {
      BlocProvider.of<PayWithKioskCubit>(context)
          .payWithKiosk(paymentToken: SecretData.paymentToken);
      return 'Kiosk';
    }
    if (paymentMethod == SecretData.mobileWalletId.toString()) {
      BlocProvider.of<PayWithMobileWalletCubit>(context)
          .payWithMobile(paymentToken: SecretData.paymentToken);
      return 'mobile';
    } else {
      return 'Other';
    }
  }
}
