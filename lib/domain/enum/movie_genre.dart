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

  @override
  String toString() => name;
}
