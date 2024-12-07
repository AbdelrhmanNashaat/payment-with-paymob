import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/home/presentation/manager/get_order_id_cubit/get_order_id_cubit.dart';
import '../../../../payment/presentation/views/payment_view.dart';
import '../../manager/get_order_id_cubit/get_order_id_state.dart';
import '../../manager/get_token_cubit/get_token_cubit.dart';
import '../../manager/get_token_cubit/get_token_state.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTokenCubit, GetTokenState>(
      listener: (context, state) {
        if (state is GetTokenSuccess) {
          isLoading = false;
          log('token done');
          context.read<GetOrderIdCubit>().getOrderId(authToken: state.token);
        }
        if (state is GetTokenFailure) {
          log(state.errorMessage);
          isLoading = false;
        }
        if (state is GetTokenLoading) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return BlocConsumer<GetOrderIdCubit, GetOrderIdState>(
          listener: (context, state) {
            if (state is GetOrderIdSuccess) {
              log('order done');
              isLoading = false;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentView(orderId: state.orderId),
                ),
              );
            }
            if (state is GetOrderIdFailure) {
              log(state.errorMessage);
              isLoading = false;
            }
            if (state is GetOrderIdLoading) {
              isLoading = true;
            }
          },
          builder: (context, orderState) {
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
              child: (isLoading)
                  ? const Center(
                      child: SizedBox(
                        height: 28,
                        width: 28,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.5,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    )
                  : const Text(
                      'Order Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
