import 'package:flutter/material.dart';

void main() {
  runApp(const Prography());
}

class Prography extends StatelessWidget {
  const Prography({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
