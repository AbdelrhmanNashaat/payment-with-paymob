import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'bottom_sheet_child_widget.dart';

class ChoosePaymentMethod extends StatelessWidget {
  const ChoosePaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Order Now',
      onPressed: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          context: context,
          builder: (context) {
            return const BottomSheetChildWidget();
          },
        );
      },
    );
  }
}
