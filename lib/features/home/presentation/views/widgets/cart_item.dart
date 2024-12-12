import 'package:flutter/material.dart';
import 'package:payment/features/home/data/models/item_model.dart';
import 'cart_image_item.dart';
import 'item_counter.dart';

class CartItem extends StatelessWidget {
  final ItemModel item;
  const CartItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CartImageItem(item: item),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.2,
                ),
              ),
              Text(
                'Color: ${item.color}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.2,
                ),
              ),
              Text(
                '${item.price} EGP',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ],
          ),
          const Spacer(),
          const ItemCounter(),
        ],
      ),
    );
  }
}
