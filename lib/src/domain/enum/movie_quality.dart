enum MovieQuality {
  all('all'),
  q720p('720p'),
  q1080p('1080p'),
  q2160p('2160p'),
  q3D('3D');

  const MovieQuality(this.name);
  final String name;

  @override
  String toString() => name;
}
