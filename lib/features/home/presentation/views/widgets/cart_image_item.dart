import 'package:flutter/material.dart';
import 'package:payment/features/home/data/models/item_model.dart';

class CartImageItem extends StatelessWidget {
  final ItemModel item;
  const CartImageItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xff844EFE),
          width: 1.2,
        ),
      ),
      child: Image.asset(
        item.image,
        width: 45,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
