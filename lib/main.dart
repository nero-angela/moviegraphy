import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:prography/helper/provider_helper.dart';
import 'package:prography/service/theme_service.dart';
import 'package:prography/view/lang/generated/l10n.dart';
import 'package:prography/view/page/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: ProviderHelper.providers,
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
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: context.watch<ThemeService>().themeData,
      home: const HomePage(),
    );
  }
}
