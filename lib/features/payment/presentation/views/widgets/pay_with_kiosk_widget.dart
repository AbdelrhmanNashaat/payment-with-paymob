import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/pay_with_kiosk_cubit/pay_with_kiosk_cubit.dart';
import '../../manager/pay_with_kiosk_cubit/pay_with_kiosk_state.dart';

class PaymentWithKioskWidget extends StatelessWidget {
  const PaymentWithKioskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayWithKioskCubit, PayWithKioskState>(
      builder: (context, state) {
        return state is PayWithKioskSuccess
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Use the code below to pay at the kiosk',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${state.billReference}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : state is PayWithKioskFailure
                ? const Center()
                : const Center(
                    child: CircularProgressIndicator(),
                  );
      },
    );
  }
}
