import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/payment/data/repo/payment_repo_implementation.dart';
import 'package:payment/features/payment/presentation/manager/pay_with_kiosk_cubit/pay_with_kiosk_cubit.dart';
import 'package:payment/features/payment/presentation/views/widgets/pay_view_body.dart';

class PayView extends StatelessWidget {
  final String paymentMethod;
  const PayView({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    final PaymentRepoImplementation paymentRepo = PaymentRepoImplementation();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PayWithKioskCubit(paymentRepo: paymentRepo),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pay'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: PayViewBody(paymentMethod: paymentMethod),
        ),
      ),
    );
  }
}
