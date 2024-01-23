import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Настройки',
      style: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
