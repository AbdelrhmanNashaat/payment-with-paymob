import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/secret_data.dart';
import 'package:payment/features/payment/presentation/manager/pay_with_kiosk_cubit/pay_with_kiosk_cubit.dart';
import 'pay_with_kiosk_widget.dart';

class PayViewBody extends StatefulWidget {
  final String paymentMethod;
  const PayViewBody({super.key, required this.paymentMethod});

  @override
  State<PayViewBody> createState() => _PayViewBodyState();
}

class _PayViewBodyState extends State<PayViewBody> {
  @override
  void initState() {
    BlocProvider.of<PayWithKioskCubit>(context)
        .payWithKiosk(paymentToken: SecretData.paymentToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const PaymentWithKioskWidget();
  }
}
