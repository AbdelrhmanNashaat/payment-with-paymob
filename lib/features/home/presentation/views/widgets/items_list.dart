import 'package:flutter/material.dart';

import '../../../data/models/item_model.dart';
import 'cart_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<ItemModel> items = [
      ItemModel(
        name: 'Polo Shirt for men',
        color: 'blue',
        price: '650',
        image: 'assets/images/shirt.png',
      ),
      ItemModel(
        name: 'Scott Bag',
        color: 'blue , white',
        price: '300',
        image: 'assets/images/backpack.png',
      ),
      ItemModel(
        name: 'Pro Tour Shoes',
        color: 'blue , red',
        price: '800',
        image: 'assets/images/running-shoes.png',
      ),
      ItemModel(
        name: 'T250 Headphones',
        color: 'light blue',
        price: '450',
        image: 'assets/images/headphones.png',
      ),
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CartItem(
          item: items[index],
        );
      },
    );
  }
}
