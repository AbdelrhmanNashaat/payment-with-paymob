import 'package:flutter/material.dart';

import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Payment Methods'),
      ),
      body: const SafeArea(child: HomeViewBody()),
    );
  }
}
