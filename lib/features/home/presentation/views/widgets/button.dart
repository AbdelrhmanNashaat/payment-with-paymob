import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/secret_data.dart';
import 'package:payment/features/home/presentation/manager/get_order_id_cubit/get_order_id_cubit.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../payment/presentation/views/payment_view.dart';
import '../../manager/get_order_id_cubit/get_order_id_state.dart';

class GetOrderIdButton extends StatelessWidget {
  const GetOrderIdButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetOrderIdCubit, GetOrderIdState>(
      listener: (context, state) {
        if (state is GetOrderIdSuccess) {
          SecretData.orderId = state.orderId;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PaymentView(),
            ),
          );
        }
        if (state is GetOrderIdFailure) {
          log(state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Order Now',
          isLoading: state is GetOrderIdLoading ? true : false,
          onPressed: () {
            context.read<GetOrderIdCubit>().getOrderId(
                  authToken: SecretData.authToken,
                );
          },
        );
      },
    );
  }
}
