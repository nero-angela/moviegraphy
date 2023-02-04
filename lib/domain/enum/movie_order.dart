enum MovieOrder {
  desc('desc'),
  asc('asc');

  const MovieOrder(this.name);
  final String name;

  @override
  String toString() => name;
}
