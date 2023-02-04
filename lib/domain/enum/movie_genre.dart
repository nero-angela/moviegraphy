enum MovieGenre {
  all('All'),
  action('Action'),
  adventure('Adventure'),
  animation('Animation'),
  biography('Biography'),
  comedy('Comedy'),
  crime('Crime'),
  documentary('Documentary'),
  drama('Drama'),
  family('Family'),
  fantasy('Fantasy'),
  filmNoir('Film Noir'),
  history('History'),
  horror('Horror'),
  music('Music'),
  musical('Musical'),
  mystery('Mystery'),
  romance('Romance'),
  sciFi('Sci-Fi'),
  short('Short'),
  sport('Sport'),
  superhero('Superhero'),
  thriller('Thriller'),
  war('War'),
  western('Western');

  const MovieGenre(this.name);
  final String name;

  @override
  String toString() => name;
}
