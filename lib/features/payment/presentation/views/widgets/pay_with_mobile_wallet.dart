import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/payment/presentation/manager/pay_with_wallet_cubit/pay_with_mobile_wallet_cubit.dart';
import 'package:payment/features/payment/presentation/manager/pay_with_wallet_cubit/pay_with_mobile_wallet_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaymentWithMobileWallet extends StatelessWidget {
  const PaymentWithMobileWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayWithMobileWalletCubit, PayWithMobileWalletState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is PayWithMobileWalletLoading ? true : false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      state is PayWithMobileWalletSuccess
                          ? state.redirectUrl
                          : 'Failed to get redirect url',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
