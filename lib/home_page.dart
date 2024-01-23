import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Главная',
      style: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
