import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:prography/core/helper/provider_helper.dart';
import 'package:prography/src/domain/enum/lang.dart';
import 'package:prography/src/service/theme_service.dart';
import 'package:prography/core/lang/generated/l10n.dart';
import 'package:prography/src/view/page/home/home_page.dart';
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
      locale: Locale(Lang.en.locale),
      supportedLocales: S.delegate.supportedLocales,
      theme: context.watch<ThemeService>().themeData,
      home: const HomePage(),
    );
  }
}
