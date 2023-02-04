import 'package:flutter/material.dart';
import 'package:prography/service/theme_service.dart';
import 'package:prography/view/page/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeService(),
        ),
      ],
      child: const Prography(),
    ),
  );
}

class Prography extends StatelessWidget {
  const Prography({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeService>().themeData,
      home: const HomePage(),
    );
  }
}
