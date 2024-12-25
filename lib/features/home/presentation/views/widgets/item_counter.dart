import 'package:flutter/material.dart';

class ItemCounter extends StatelessWidget {
  const ItemCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xffF5FAF9),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.add,
            size: 18,
            color: Color(0xffBAA7EE),
          ),
          Text('1'),
          Icon(
            Icons.remove,
            size: 18,
            color: Color(0xffBAA7EE),
          ),
        ],
      ),
    );
  }
}
