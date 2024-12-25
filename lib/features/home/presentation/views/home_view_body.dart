import 'package:flutter/material.dart';
import 'widgets/button.dart';
import 'widgets/items_list.dart';
import 'widgets/total_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CartListView(),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 20),
          ),
          TotalWidget(),
          SizedBox(height: 20),
          ChoosePaymentMethod(),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
