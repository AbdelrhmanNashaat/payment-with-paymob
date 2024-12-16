import 'package:flutter/material.dart';
import 'items_list.dart';
import 'pay_button.dart';
import 'total_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
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
          PayButton(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
