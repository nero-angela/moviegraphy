import 'package:prography/core/base/base_view_model.dart';
import 'package:prography/src/domain/entity/movie.dart';
import 'package:prography/src/repository/remote_google_trans_repository.dart';
import 'package:prography/src/service/theme_service.dart';

class MovieDetailPageModel extends BaseViewModel {
  MovieDetailPageModel({
    required this.movie,
    required ThemeService themeService,
    required RemoteGoogleTransRepository remoteGoogleTransRepository,
  })  : _themeService = themeService,
        _remoteGoogleTransRepository = remoteGoogleTransRepository;

  final ThemeService _themeService;
  final RemoteGoogleTransRepository _remoteGoogleTransRepository;

  Movie movie;
  bool isTranslated = false;
  String get title => isTranslated ? movie.titleKorean ?? movie.title : movie.title;
  String get description => isTranslated
      ? movie.descriptionFullKorean ?? movie.descriptionFull
      : movie.descriptionFull;

  /// AppBar 닫혀있는지 여부
  bool _isAppBarCollapsed = false;
  bool get isAppBarCollapsed => _isAppBarCollapsed;
  set isAppBarCollapsed(bool isAppBarCollapsed) {
    if (_isAppBarCollapsed != isAppBarCollapsed) {
      _isAppBarCollapsed = isAppBarCollapsed;

      notifyListeners();
    }
  }

  /// 제목 & 설명 번역
  Future<void> translate() async {
    /// 이미 번역함
    if (movie.titleKorean == null) {
      final results = await Future.wait([
        _translate(movie.title),
        _translate(movie.descriptionFull),
      ]);
      movie = movie.copyWith(
        titleKorean: results[0],
        descriptionFullKorean: results[1],
      );
    }

    isTranslated = !isTranslated;
    notifyListeners();
  }

  /// Translate
  Future<String> _translate(String q) async {
    return await _remoteGoogleTransRepository.translate(q);
  }
}
