import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../payment/presentation/views/payment_view.dart';
import '../../manager/get_token_cubit/get_token_cubit.dart';
import '../../manager/get_token_cubit/get_token_state.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTokenCubit, GetTokenState>(
      listener: (context, state) {
        if (state is GetTokenSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const PaymentView(),
            ),
          );
        }
        if (state is GetTokenFailure) {
          log(state.errorMessage);
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 46),
            backgroundColor: const Color(0xff844EFE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            context.read<GetTokenCubit>().getToken();
          },
          child: state is! GetTokenLoading
              ? const Text(
                  'Order Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              : const Center(
                  child: SizedBox(
                    height: 28,
                    width: 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
