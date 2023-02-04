enum MovieSort {
  title('title'),
  year('year'),
  rating('rating'),
  peers('peers'),
  seeds('seeds'),
  downloadCount('download_count'),
  likeCount('like_count'),
  dateAdded('date_added');

  const MovieSort(this.name);
  final String name;

  @override
  String toString() => name;
}
