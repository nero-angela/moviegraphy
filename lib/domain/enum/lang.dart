import 'package:prography/view/lang/generated/l10n.dart';

enum Lang {
  ko('ko'),
  en('en');

  const Lang(this.locale);

  final String locale;

  @override
  String toString() {
    switch (this) {
      case Lang.ko:
        return S.current.ko;
      case Lang.en:
        return S.current.en;
    }
  }
}
