import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Каталог',
      style: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
