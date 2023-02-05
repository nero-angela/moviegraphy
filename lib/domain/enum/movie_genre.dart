import 'package:prography/view/lang/generated/l10n.dart';

enum MovieGenre {
  action('action'),
  adventure('adventure'),
  animation('animation'),
  biography('biography'),
  comedy('comedy'),
  crime('crime'),
  documentary('documentary'),
  drama('drama'),
  family('family'),
  fantasy('fantasy'),
  filmNoir('film-noir'),
  gameShow('game-show'),
  history('history'),
  horror('horror'),
  music('music'),
  musical('musical'),
  mystery('mystery'),
  news('news'),
  realityTv('reality-tv'),
  romance('romance'),
  sciFi('sci-fi'),
  sport('sport'),
  talkShow('talk-show'),
  thriller('thriller'),
  war('war'),
  western('western');

  const MovieGenre(this.name);
  final String name;
  String get intl {
    switch (this) {
      case MovieGenre.action:
        return S.current.action;
      case MovieGenre.adventure:
        return S.current.adventure;
      case MovieGenre.animation:
        return S.current.animation;
      case MovieGenre.biography:
        return S.current.biography;
      case MovieGenre.comedy:
        return S.current.comedy;
      case MovieGenre.crime:
        return S.current.crime;
      case MovieGenre.documentary:
        return S.current.documentary;
      case MovieGenre.drama:
        return S.current.drama;
      case MovieGenre.family:
        return S.current.family;
      case MovieGenre.fantasy:
        return S.current.fantasy;
      case MovieGenre.filmNoir:
        return S.current.filmNoir;
      case MovieGenre.gameShow:
        return S.current.gameShow;
      case MovieGenre.history:
        return S.current.history;
      case MovieGenre.horror:
        return S.current.horror;
      case MovieGenre.music:
        return S.current.music;
      case MovieGenre.musical:
        return S.current.musical;
      case MovieGenre.mystery:
        return S.current.mystery;
      case MovieGenre.news:
        return S.current.news;
      case MovieGenre.realityTv:
        return S.current.realityTv;
      case MovieGenre.romance:
        return S.current.romance;
      case MovieGenre.sciFi:
        return S.current.sciFi;
      case MovieGenre.sport:
        return S.current.sport;
      case MovieGenre.talkShow:
        return S.current.talkShow;
      case MovieGenre.thriller:
        return S.current.thriller;
      case MovieGenre.war:
        return S.current.war;
      case MovieGenre.western:
        return S.current.western;
    }
  }

  @override
  String toString() => intl.toUpperCase();
}
