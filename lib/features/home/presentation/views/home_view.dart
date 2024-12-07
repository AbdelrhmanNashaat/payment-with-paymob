import 'package:flutter/material.dart';

import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9F8),
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F9F8),
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
