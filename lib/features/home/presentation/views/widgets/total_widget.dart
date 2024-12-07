import 'package:flutter/material.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Total',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          '2200 EGP',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
